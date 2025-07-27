#!/bin/bash

# ArgoCD Port Forwarding Script

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

NAMESPACE="argocd"
LOCAL_PORT="8080"
SERVICE_PORT="443"
SERVICE_NAME="argocd-server"

echo -e "${BLUE}🔗 ArgoCD Port Forwarding${NC}"
echo -e "${BLUE}========================${NC}"
echo ""

# Check if kubectl is available
if ! command -v kubectl &> /dev/null; then
    echo -e "${RED}❌ kubectl is not installed${NC}"
    exit 1
fi

# Check if ArgoCD namespace exists
if ! kubectl get namespace ${NAMESPACE} &> /dev/null; then
    echo -e "${RED}❌ ArgoCD namespace '${NAMESPACE}' not found${NC}"
    echo -e "${YELLOW}💡 Please install ArgoCD first using: ./scripts/setup.sh${NC}"
    exit 1
fi

# Check if ArgoCD server service exists
if ! kubectl get service ${SERVICE_NAME} -n ${NAMESPACE} &> /dev/null; then
    echo -e "${RED}❌ ArgoCD server service not found${NC}"
    exit 1
fi

# Check if port is already in use
if lsof -Pi :${LOCAL_PORT} -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Port ${LOCAL_PORT} is already in use${NC}"
    
    # Check if it's ArgoCD port forwarding
    if pgrep -f "kubectl.*port-forward.*argocd-server" > /dev/null; then
        echo -e "${GREEN}✅ ArgoCD port forwarding is already running${NC}"
        echo ""
        echo -e "${GREEN}🌐 Access Information:${NC}"
        echo "  URL: https://localhost:${LOCAL_PORT}"
        echo "  Username: admin"
        echo "  Password: Run './scripts/get-admin-password.sh' to get password"
        echo ""
        echo -e "${BLUE}💡 To stop port forwarding:${NC}"
        echo "  Press Ctrl+C or kill the kubectl process"
        exit 0
    else
        echo -e "${RED}❌ Port ${LOCAL_PORT} is used by another process${NC}"
        echo ""
        echo -e "${BLUE}🔍 Process using port ${LOCAL_PORT}:${NC}"
        lsof -Pi :${LOCAL_PORT} -sTCP:LISTEN
        echo ""
        echo -e "${YELLOW}💡 Try using a different port:${NC}"
        echo "  kubectl port-forward svc/${SERVICE_NAME} -n ${NAMESPACE} 8081:${SERVICE_PORT}"
        exit 1
    fi
fi

# Check ArgoCD server status
echo -e "${BLUE}🔍 Checking ArgoCD server status...${NC}"
SERVER_STATUS=$(kubectl get pods -l app.kubernetes.io/name=argocd-server -n ${NAMESPACE} -o jsonpath='{.items[0].status.phase}' 2>/dev/null || echo "Unknown")

if [ "$SERVER_STATUS" != "Running" ]; then
    echo -e "${YELLOW}⚠️  ArgoCD server status: ${SERVER_STATUS}${NC}"
    echo -e "${BLUE}📋 Checking pod details...${NC}"
    kubectl get pods -l app.kubernetes.io/name=argocd-server -n ${NAMESPACE}
    echo ""
    echo -e "${YELLOW}💡 Waiting for ArgoCD server to be ready...${NC}"
    kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n ${NAMESPACE} --timeout=60s
fi

echo -e "${GREEN}✅ ArgoCD server is ready${NC}"
echo ""

# Display access information before starting
echo -e "${GREEN}🌐 ArgoCD Access Information:${NC}"
echo "  URL: https://localhost:${LOCAL_PORT}"
echo "  Username: admin"
echo "  Password: Run './scripts/get-admin-password.sh' to get password"
echo ""

# Check if admin password is available
ADMIN_PASSWORD=$(kubectl -n ${NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" 2>/dev/null | base64 -d 2>/dev/null || echo "")
if [ -n "$ADMIN_PASSWORD" ]; then
    echo -e "${GREEN}🔑 Admin Password: ${ADMIN_PASSWORD}${NC}"
    echo ""
fi

echo -e "${BLUE}📋 Browser Instructions:${NC}"
echo "  1. Open your browser and go to: https://localhost:${LOCAL_PORT}"
echo "  2. Accept the self-signed certificate warning"
echo "  3. Login with username 'admin' and the password above"
echo ""

echo -e "${YELLOW}💡 Tips:${NC}"
echo "  • Press Ctrl+C to stop port forwarding"
echo "  • Keep this terminal open while using ArgoCD"
echo "  • The connection will be automatically restored if it drops"
echo ""

# Trap to handle cleanup
cleanup() {
    echo ""
    echo -e "${YELLOW}🛑 Stopping port forwarding...${NC}"
    echo -e "${GREEN}✅ Port forwarding stopped${NC}"
    exit 0
}

trap cleanup INT TERM

# Start port forwarding
echo -e "${BLUE}🚀 Starting port forwarding...${NC}"
echo "  Local: localhost:${LOCAL_PORT}"
echo "  Remote: ${SERVICE_NAME}.${NAMESPACE}:${SERVICE_PORT}"
echo ""
echo -e "${GREEN}✅ Port forwarding active!${NC}"
echo -e "${BLUE}🌐 Open https://localhost:${LOCAL_PORT} in your browser${NC}"
echo ""

# Start port forwarding with retry logic
while true; do
    kubectl port-forward svc/${SERVICE_NAME} -n ${NAMESPACE} ${LOCAL_PORT}:${SERVICE_PORT} || {
        echo -e "${YELLOW}⚠️  Port forwarding disconnected. Retrying in 5 seconds...${NC}"
        sleep 5
    }
done 