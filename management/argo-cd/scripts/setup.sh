#!/bin/bash

# ArgoCD Setup Script for Dev Environment
# This script installs ArgoCD using Kustomize in a dev environment

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
NAMESPACE="argocd"
CONTEXT=$(kubectl config current-context)
BRANCH="dev"

echo -e "${BLUE}🚀 ArgoCD Setup Script for Dev Environment${NC}"
echo -e "${BLUE}===========================================${NC}"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check prerequisites
echo -e "${BLUE}🔍 Checking prerequisites...${NC}"

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    print_error "kubectl is not installed. Please install kubectl first."
    exit 1
fi

# Check if kustomize is installed
if ! command -v kustomize &> /dev/null; then
    print_warning "kustomize is not installed. Installing kustomize..."
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
    sudo mv kustomize /usr/local/bin/
    print_status "kustomize installed successfully"
fi

# Check if we're in the right directory
if [ ! -f "management/argo-cd/overlays/dev/kustomization.yaml" ]; then
    print_error "Please run this script from the project root directory"
    exit 1
fi

# Check cluster connection
print_info "Current kubectl context: ${CONTEXT}"
if ! kubectl cluster-info &> /dev/null; then
    print_error "Cannot connect to Kubernetes cluster. Please check your kubectl configuration."
    exit 1
fi

print_status "Prerequisites check completed"
echo ""

# Confirm installation
echo -e "${YELLOW}📋 Installation Summary:${NC}"
echo "  • Namespace: ${NAMESPACE}"
echo "  • Environment: ${BRANCH}"
echo "  • Context: ${CONTEXT}"
echo "  • ArgoCD Version: v2.9.3"
echo ""

read -p "Do you want to proceed with ArgoCD installation? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Installation cancelled"
    exit 0
fi

echo ""
echo -e "${BLUE}🔨 Starting ArgoCD installation...${NC}"

# Step 1: Validate Kustomize configuration
print_info "Validating Kustomize configuration..."
cd management/argo-cd/overlays/dev
if kustomize build . > /tmp/argocd-manifests.yaml; then
    print_status "Kustomize configuration is valid"
else
    print_error "Kustomize configuration validation failed"
    exit 1
fi

# Step 2: Apply ArgoCD manifests
print_info "Applying ArgoCD manifests..."
if kubectl apply -k .; then
    print_status "ArgoCD manifests applied successfully"
else
    print_error "Failed to apply ArgoCD manifests"
    exit 1
fi

cd - > /dev/null

# Step 3: Wait for ArgoCD to be ready
print_info "Waiting for ArgoCD to be ready..."
echo "This may take a few minutes..."

# Wait for namespace
kubectl wait --for=condition=Ready namespace/${NAMESPACE} --timeout=60s

# Wait for deployments
deployments=("argocd-server" "argocd-repo-server" "argocd-redis" "argocd-dex-server")
for deployment in "${deployments[@]}"; do
    print_info "Waiting for ${deployment} to be ready..."
    kubectl wait --for=condition=available deployment/${deployment} -n ${NAMESPACE} --timeout=300s
done

# Wait for StatefulSet (application-controller)
print_info "Waiting for argocd-application-controller to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-application-controller -n ${NAMESPACE} --timeout=300s

print_status "All ArgoCD components are ready!"
echo ""

# Step 4: Get admin password
print_info "Retrieving admin password..."
ADMIN_PASSWORD=""
retry_count=0
max_retries=10

while [ -z "$ADMIN_PASSWORD" ] && [ $retry_count -lt $max_retries ]; do
    ADMIN_PASSWORD=$(kubectl -n ${NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" 2>/dev/null | base64 -d 2>/dev/null || echo "")
    if [ -z "$ADMIN_PASSWORD" ]; then
        print_info "Waiting for admin secret to be created... (attempt $((retry_count + 1))/${max_retries})"
        sleep 10
        ((retry_count++))
    fi
done

if [ -z "$ADMIN_PASSWORD" ]; then
    print_warning "Could not retrieve admin password automatically"
    print_info "You can get it later using: kubectl -n ${NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\" | base64 -d"
else
    print_status "Admin password retrieved successfully"
fi

# Step 4.5: Validate critical configurations
echo -e "${BLUE}🔍 Validating ArgoCD configuration...${NC}"

# Check if server.insecure is properly configured
CONFIGMAP_CHECK=$(kubectl get configmap argocd-cmd-params-cm -n ${NAMESPACE} -o jsonpath='{.data.server\.insecure}' 2>/dev/null || echo "")
if [ "$CONFIGMAP_CHECK" = "true" ]; then
    print_status "server.insecure properly configured in argocd-cmd-params-cm"
else
    print_warning "server.insecure not found in argocd-cmd-params-cm, checking argocd-cm..."
    
    CONFIGMAP_CHECK2=$(kubectl get configmap argocd-cm -n ${NAMESPACE} -o jsonpath='{.data.server\.insecure}' 2>/dev/null || echo "")
    if [ "$CONFIGMAP_CHECK2" = "true" ]; then
        print_status "server.insecure properly configured in argocd-cm"
    else
        print_error "server.insecure not properly configured! ALB health checks may fail."
        print_info "Applying fix..."
        kubectl patch configmap argocd-cmd-params-cm -n ${NAMESPACE} --patch '{"data":{"server.insecure":"true"}}' || {
            print_error "Failed to patch ConfigMap. Please check manually."
        }
        
        # Restart ArgoCD server to apply the change
        print_info "Restarting ArgoCD server to apply configuration..."
        kubectl rollout restart deployment argocd-server -n ${NAMESPACE}
        
        # Wait for rollout to complete
        kubectl rollout status deployment argocd-server -n ${NAMESPACE} --timeout=300s
        print_status "ArgoCD server restarted successfully"
    fi
fi

# Check if Ingress is properly configured
INGRESS_CHECK=$(kubectl get ingress argocd-server-ingress -n ${NAMESPACE} -o jsonpath='{.metadata.annotations}' 2>/dev/null || echo "")
if echo "$INGRESS_CHECK" | grep -q "certificate-arn"; then
    print_status "Ingress SSL configuration found"
else
    print_warning "Ingress SSL configuration not found (this is okay for local development)"
fi

echo ""
echo -e "${GREEN}🎉 ArgoCD installation completed successfully!${NC}"
echo -e "${GREEN}============================================${NC}"
echo ""

# Step 5: Display access information
echo -e "${BLUE}📱 Access Information:${NC}"
echo ""

# Check if ALB Ingress is available
INGRESS_HOST=$(kubectl get ingress argocd-server-ingress -n ${NAMESPACE} -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' 2>/dev/null || echo "")

if [ -n "$INGRESS_HOST" ]; then
    echo -e "${GREEN}🌐 Web UI (ALB Ingress):${NC}"
    echo "  URL: https://${INGRESS_HOST}"
    echo "  Alternative: http://${INGRESS_HOST}"
else
    print_info "ALB Ingress not ready yet. You can access ArgoCD via port forwarding:"
fi

echo ""
echo -e "${GREEN}🔗 Port Forwarding:${NC}"
echo "  Command: kubectl port-forward svc/argocd-server -n ${NAMESPACE} 8080:443"
echo "  URL: https://localhost:8080"
echo ""

echo -e "${GREEN}👤 Login Credentials:${NC}"
echo "  Username: admin"
if [ -n "$ADMIN_PASSWORD" ]; then
    echo "  Password: ${ADMIN_PASSWORD}"
else
    echo "  Password: <run get-admin-password.sh to retrieve>"
fi

echo ""
echo -e "${GREEN}🛠️  Useful Commands:${NC}"
echo "  • Get admin password: ./scripts/get-admin-password.sh"
echo "  • Port forward: ./scripts/port-forward.sh"
echo "  • Check status: kubectl get all -n ${NAMESPACE}"
echo "  • View logs: kubectl logs -l app.kubernetes.io/name=argocd-server -n ${NAMESPACE}"

echo ""
echo -e "${BLUE}🔧 Next Steps:${NC}"
echo "  1. Access ArgoCD UI using the credentials above"
echo "  2. Configure your Git repository in ArgoCD"
echo "  3. Create your first application using App of Apps pattern"
echo "  4. Set up monitoring and alerts"

echo ""
print_status "ArgoCD setup completed! Happy GitOps! 🚀" 