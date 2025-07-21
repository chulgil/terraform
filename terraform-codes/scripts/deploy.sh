#!/bin/bash
set -euo pipefail

# Get script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Set environment (default to dev if not provided)
ENV="${1:-dev}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Set up logging
LOG_DIR="${PROJECT_ROOT}/logs"
mkdir -p "${LOG_DIR}"
LOG_FILE="${LOG_DIR}/deploy_${ENV}_${TIMESTAMP}.log"
PID_FILE="/tmp/terraform_deploy_${ENV}.pid"

# Function to log messages
log() {
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[${timestamp}] $1" | tee -a "${LOG_FILE}"
}



# Function to clean up Terraform provider cache
cleanup_terraform_providers() {
  log "Cleaning up Terraform provider cache..."
  local cache_dirs=(
    "${PWD}/.terraform/providers"
    "${PWD}/.terraform/plugins"
    "${HOME}/.terraform.d/plugin-cache"
    "${HOME}/.terraform.d/providers"
    "${HOME}/.terraform.d/plugin-cache/darwin_arm64"
    "${HOME}/.terraform.d/plugin-cache/registry.terraform.io/hashicorp/aws"
  )
  
  for dir in "${cache_dirs[@]}"; do
    if [ -d "${dir}" ]; then
      log "Removing directory: ${dir}"
      rm -rf "${dir}" 2>/dev/null || true
    fi
  done
  
  # Remove lock files
  rm -f "${PWD}/.terraform.lock.hcl" 2>/dev/null || true
  
  log "Terraform provider cache cleanup complete."
}

# Function to clean up on exit
cleanup() {
  if [ -f "${PID_FILE}" ]; then
    local pid
    pid=$(cat "${PID_FILE}")
    if ps -p "${pid}" > /dev/null; then
      log "Terminating background process (PID: ${pid})..."
      kill -TERM "${pid}" 2>/dev/null || true
    fi
    rm -f "${PID_FILE}"
  fi
}

# Set trap for script exit
trap cleanup EXIT

# Check if another deployment is running
if [ -f "${PID_FILE}" ]; then
  local old_pid
  old_pid=$(cat "${PID_FILE}")
  if ps -p "${old_pid}" > /dev/null; then
    log "Another deployment is already running (PID: ${old_pid}). Exiting."
    exit 1
  else
    log "Found stale PID file. Cleaning up..."
    rm -f "${PID_FILE}"
  fi
fi

# Environment validation
log "Validating environment: ${ENV}"
if [ ! -d "${PROJECT_ROOT}/environments/${ENV}" ]; then
  log "Error: Environment '${ENV}' not found."
  log "Available environments: $(ls -m ${PROJECT_ROOT}/environments)"
  exit 1
fi

# Check for terraform.tfvars
if [ ! -f "${PROJECT_ROOT}/environments/${ENV}/terraform.tfvars" ]; then
  log "Error: terraform.tfvars not found in environments/${ENV}/"
  log "Please create terraform.tfvars from terraform.tfvars.example"
  exit 1
fi

# Set environment directory
ENV_DIR="${PROJECT_ROOT}/environments/${ENV}"

# Validate environment directory
if [ ! -d "${ENV_DIR}" ]; then
  log "Error: Environment directory not found: ${ENV_DIR}"
  exit 1
fi

# Change to environment directory
cd "${ENV_DIR}" || { log "Failed to change to environment directory: ${ENV_DIR}"; exit 1; }

# Function to run Terraform commands with enhanced logging
run_terraform() {
  local command=$1
  local target=${2:-}
  local retries=3
  local count=0
  local success=0
  
  log "Running: terraform $command $target in $(pwd)"
  
  # Clean up any existing provider cache before initialization
  cleanup_terraform_providers
  
  # Initialize Terraform if needed
  if [ ! -d ".terraform" ] || [ "$command" == "init" ]; then
    log "Initializing Terraform..."
    
    # Create a temporary provider configuration if it doesn't exist
    if [ ! -f "provider.tf" ]; then
      cat > provider.tf <<- 'EOT'
      terraform {
        required_providers {
          aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
          }
        }
      }
      EOT
    fi
    
    # Initialize with plugin cache disabled
    TF_PLUGIN_CACHE_DIR="" terraform init -input=false -no-color -upgrade || {
      log "Terraform initialization failed, retrying with -reconfigure..."
      TF_PLUGIN_CACHE_DIR="" terraform init -reconfigure -input=false -no-color -upgrade || {
        log "Terraform initialization failed after retry"
        return 1
      }
    }
  fi
  
  # For init command, we're already done
  if [ "$command" == "init" ]; then
    return 0
  fi
  
  # Run the Terraform command with retries
  while [ $count -lt $retries ]; do
    log "Attempt $((count + 1)) of $retries"
    
    # Run the command directly without capturing output to avoid buffering issues
    if [ -n "$target" ]; then
      if ! terraform "$command" -input=false -no-color "$target"; then
        log "Command failed with exit code $?"
      else
        success=1
        break
      fi
    else
      if ! terraform "$command" -input=false -no-color; then
        log "Command failed with exit code $?"
      else
        success=1
        break
      fi
    fi
    
    if [ $count -lt $((retries - 1)) ]; then
      log "Retrying in 10 seconds..."
      sleep 10
    fi
    count=$((count + 1))
  done
  
  if [ $success -eq 0 ]; then
    log "Command failed after $retries attempts"
    # Try to get more detailed error information
    log "Last 20 lines of terraform output:"
    tail -n 20 "${LOG_FILE}" | while IFS= read -r line; do log "$line"; done
    return 1
  fi
  
  return 0
}

# Function to collect EKS diagnostic information
collect_eks_diagnostics() {
  log "=== Collecting EKS Diagnostics ==="
  
  # Get cluster name from Terraform state
  local cluster_name
  cluster_name=$(cd "${ENV_DIR}" && terraform output -raw cluster_name 2>/dev/null || echo "dev-eks-cluster")
  
  log "Cluster Name: $cluster_name"
  
  # Get EKS node groups
  log "\n=== EKS Node Groups ==="
  aws eks list-nodegroups --cluster-name "$cluster_name" --region ap-northeast-2 >> "${LOG_FILE}" 2>&1 || true
  
  # Get node group status
  local nodegroup
  nodegroup=$(aws eks list-nodegroups --cluster-name "$cluster_name" --region ap-northeast-2 --query 'nodegroups[0]' --output text 2>/dev/null || true)
  
  if [ -n "$nodegroup" ]; then
    log "\n=== Node Group Status ==="
    aws eks describe-nodegroup --cluster-name "$cluster_name" --nodegroup-name "$nodegroup" --region ap-northeast-2 >> "${LOG_FILE}" 2>&1 || true
    
    # Get instance IDs from the node group
    log "\n=== Node Group Instances ==="
    local instance_ids
    instance_ids=$(aws ec2 describe-instances \
      --filters "Name=tag:aws:eks:cluster-name,Values=$cluster_name" \
      --query 'Reservations[].Instances[].InstanceId' \
      --region ap-northeast-2 \
      --output text 2>/dev/null || true)
    
    if [ -n "$instance_ids" ]; then
      log "Instance IDs: $instance_ids"
      
      # Get instance status
      log "\n=== Instance Status ==="
      for instance_id in $instance_ids; do
        log "\nInstance: $instance_id"
        aws ec2 describe-instance-status --instance-ids "$instance_id" --region ap-northeast-2 >> "${LOG_FILE}" 2>&1 || true
        
        # Get console output (last 64KB)
        log "\n=== Console Output (last 64KB) ==="
        aws ec2 get-console-output --instance-id "$instance_id" --region ap-northeast-2 --output text >> "${LOG_FILE}" 2>&1 || true
      done
    fi
  fi
  
  # Get EKS cluster logs
  log "\n=== EKS Cluster Logs ==="
  local log_group="/aws/eks/$cluster_name/cluster"
  if aws logs describe-log-groups --log-group-name-prefix "$log_group" --query 'logGroups[].logGroupName' --output text | grep -q "$log_group"; then
    local log_stream
    log_stream=$(aws logs describe-log-streams \
      --log-group-name "$log_group" \
      --order-by LastEventTime \
      --descending \
      --max-items 1 \
      --query 'logStreams[0].logStreamName' \
      --output text 2>/dev/null || true)
    
    if [ -n "$log_stream" ] && [ "$log_stream" != "None" ]; then
      log "\nLatest logs from $log_stream:"
      aws logs get-log-events \
        --log-group-name "$log_group" \
        --log-stream-name "$log_stream" \
        --limit 50 \
        --region ap-northeast-2 >> "${LOG_FILE}" 2>&1 || true
    fi
  fi
  
  log "=== End of Diagnostics ===\n"
  wait "${pid}" || {
    log "${step} failed. Check ${LOG_FILE} for details."
    exit 1
  }
  rm -f "${PID_FILE}"
  log "${step} completed successfully."
}

# Main deployment process
log "Starting deployment to ${ENV} environment..."
log "Log file: ${LOG_FILE}"

# Initialize Terraform
run_terraform "init -input=false" "Terraform Init"

# Run Terraform plan
log "Running terraform plan..."
terraform plan -out=tfplan -input=false | tee -a "${LOG_FILE}" || {
  log "Terraform plan failed. Check ${LOG_FILE} for details."
  exit 1
}

# Ask for confirmation
log "Plan completed. Review the plan above."
log "Do you want to apply these changes? (y/n)"
read -p "Apply changes? (y/n): " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  log "Deployment cancelled by user."
  exit 0
fi

# Apply changes
run_terraform "apply -auto-approve tfplan" "Terraform Apply"

# Update kubeconfig
log "Updating kubeconfig..."
if ! aws eks update-kubeconfig \
  --region "$(terraform output -raw region)" \
  --name "$(terraform output -raw cluster_name)" \
  --kubeconfig "${HOME}/.kube/config_${ENV}" \
  --alias "${ENV}" 2>&1 | tee -a "${LOG_FILE}"; then
  log "Warning: Failed to update kubeconfig. Check ${LOG_FILE} for details."
fi

log "Deployment completed successfully!"
log "Full deployment log: ${LOG_FILE}"
