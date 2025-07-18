#!/bin/bash

# Set error handling
set -e

# Get script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Environment setup
ENV=${1:-dev}
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_DIR="${PROJECT_ROOT}/logs"
LOG_FILE="${LOG_DIR}/deploy_${ENV}_${TIMESTAMP}.log"
PID_FILE="/tmp/terraform_deploy_${ENV}.pid"

# Create logs directory if it doesn't exist
mkdir -p "${LOG_DIR}"

# Function to log messages
log() {
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[${timestamp}] $1" | tee -a "${LOG_FILE}"
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

# Change to environment directory
cd "${PROJECT_ROOT}/environments/${ENV}"

# Function to run terraform commands with logging
run_terraform() {
  local command=$1
  local step=$2
  log "Starting ${step}..."
  
  # Run terraform command with nohup in background
  nohup bash -c "
    set -e
    terraform ${command} 2>&1 | 
    while IFS= read -r line; do 
      echo \"[$(date '+%Y-%m-%d %H:%M:%S')] ${step}: \$line\" >> \"${LOG_FILE}\"
      echo \"${step}: \$line\"
    done
    echo \"[$(date '+%Y-%m-%d %H:%M:%S')] ${step} completed with status: \$?\" >> \"${LOG_FILE}\"
  " > /dev/null 2>&1 &
  
  local pid=$!
  echo "${pid}" > "${PID_FILE}"
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
read -p "Do you want to apply these changes? (y/n) " -n 1 -r
echo
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
