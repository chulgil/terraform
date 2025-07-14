#!/bin/bash

# Print script header
echo "🚀 Starting Terraform environment cleanup and initialization..."
echo "--------------------------------------------"

# Set project root directory
PROJECT_ROOT="/Users/r00360/Dev/devops/terraform/terraform-codes"
cd "$PROJECT_ROOT" || exit 1

# Function to print section headers
print_section() {
    echo -e "\n🔹 $1"
    echo "--------------------------------------------"
}

# 1. Remove all .terraform directories
print_section "Removing .terraform directories..."
find . -type d -name ".terraform" -exec rm -rf {} +
echo "✅ Removed all .terraform directories"

# 2. Remove all .terraform.lock.hcl files
print_section "Removing .terraform.lock.hcl files..."
find . -name ".terraform.lock.hcl" -delete
find . -name ".terraform.lock.hcl.*" -delete 2>/dev/null
echo "✅ Removed all .terraform.lock.hcl files"

# 3. Remove terraform.tfstate* files (with confirmation)
print_section "Checking for terraform state files..."
STATE_FILES=$(find . -name "terraform.tfstate*" | wc -l)

if [ "$STATE_FILES" -gt 0 ]; then
    echo "⚠️  Found $STATE_FILES terraform state files"
    read -p "Do you want to remove terraform state files? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        find . -name "terraform.tfstate*" -delete
        echo "✅ Removed terraform state files"
    fi
else
    echo "ℹ️  No terraform state files found"
fi

# 4. Remove global plugin cache
print_section "Cleaning global plugin cache..."
rm -rf ~/.terraform.d/plugin-cache 2>/dev/null
echo "✅ Cleaned global plugin cache"

# 5. Initialize Terraform in production environment
print_section "Initializing Terraform..."
cd "$PROJECT_ROOT/envs/production" || exit 1

echo "Running: terraform init -upgrade"
terraform init -upgrade

# 6. Show Terraform version and provider status
echo -e "\n🔍 Terraform environment status:"
echo "--------------------------------------------"
echo "Terraform version:"
terraform version

echo -e "\nInitialized providers:"
terraform providers

echo -e "\n✅ Cleanup and initialization complete!"
echo "You can now run 'terraform plan' to verify your configuration."
