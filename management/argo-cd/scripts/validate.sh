#!/bin/bash

# ArgoCD Configuration Validation Script

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 ArgoCD Configuration Validation${NC}"
echo -e "${BLUE}==================================${NC}"
echo ""

# Check prerequisites
if ! command -v kubectl &> /dev/null; then
    echo -e "${RED}❌ kubectl is not installed${NC}"
    exit 1
fi

if ! command -v kustomize &> /dev/null; then
    echo -e "${RED}❌ kustomize is not installed${NC}"
    exit 1
fi

# Validation functions
validate_kustomize() {
    local path=$1
    local name=$2
    
    echo -e "${BLUE}📋 Validating ${name}...${NC}"
    
    if [ ! -f "${path}/kustomization.yaml" ]; then
        echo -e "${RED}❌ kustomization.yaml not found in ${path}${NC}"
        return 1
    fi
    
    if kustomize build "${path}" > /tmp/validation-${name}.yaml 2>/dev/null; then
        echo -e "${GREEN}✅ ${name} kustomization is valid${NC}"
        
        # Check for required resources
        if grep -q "kind: Namespace" /tmp/validation-${name}.yaml; then
            echo -e "${GREEN}✅ Namespace resource found${NC}"
        else
            echo -e "${YELLOW}⚠️  No Namespace resource found${NC}"
        fi
        
        return 0
    else
        echo -e "${RED}❌ ${name} kustomization validation failed${NC}"
        return 1
    fi
}

validate_yaml() {
    local file=$1
    local name=$2
    
    echo -e "${BLUE}📋 Validating ${name}...${NC}"
    
    if [ ! -f "${file}" ]; then
        echo -e "${RED}❌ ${file} not found${NC}"
        return 1
    fi
    
    if kubectl --dry-run=client apply -f "${file}" &> /dev/null; then
        echo -e "${GREEN}✅ ${name} YAML is valid${NC}"
        return 0
    else
        echo -e "${RED}❌ ${name} YAML validation failed${NC}"
        return 1
    fi
}

# Main validation
echo -e "${BLUE}🔍 Starting validation...${NC}"
echo ""

VALIDATION_PASSED=true

# Validate base configuration
if ! validate_kustomize "management/argo-cd/base" "ArgoCD Base"; then
    VALIDATION_PASSED=false
fi

echo ""

# Validate dev overlay
if ! validate_kustomize "management/argo-cd/overlays/dev" "ArgoCD Dev Overlay"; then
    VALIDATION_PASSED=false
fi

echo ""

# Validate applications
if ! validate_yaml "management/argo-cd/applications/app-of-apps.yaml" "App of Apps"; then
    VALIDATION_PASSED=false
fi

echo ""

if ! validate_yaml "management/argo-cd/applications/projects/dev-services.yaml" "Dev Services"; then
    VALIDATION_PASSED=false
fi

echo ""

# Check script permissions
echo -e "${BLUE}📋 Checking script permissions...${NC}"
for script in setup.sh port-forward.sh; do
    if [ -f "management/argo-cd/scripts/${script}" ]; then
        if [ -x "management/argo-cd/scripts/${script}" ]; then
            echo -e "${GREEN}✅ ${script} is executable${NC}"
        else
            echo -e "${YELLOW}⚠️  ${script} is not executable, fixing...${NC}"
            chmod +x "management/argo-cd/scripts/${script}"
            echo -e "${GREEN}✅ ${script} made executable${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️  ${script} not found${NC}"
    fi
done

echo ""

# Summary
if [ "$VALIDATION_PASSED" = true ]; then
    echo -e "${GREEN}🎉 All validations passed!${NC}"
    echo -e "${GREEN}================================${NC}"
    echo ""
    echo -e "${BLUE}🚀 Ready to deploy ArgoCD!${NC}"
    echo "  Run: ./management/argo-cd/scripts/setup.sh"
else
    echo -e "${RED}❌ Some validations failed!${NC}"
    echo -e "${RED}=========================${NC}"
    echo ""
    echo -e "${YELLOW}💡 Please fix the issues above before proceeding${NC}"
    exit 1
fi 