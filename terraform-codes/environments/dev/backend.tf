terraform {
  backend "s3" {
    bucket         = "test-s3-tf-state-421114334882"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-2"
    use_lockfile   = true
    encrypt        = true
  }
}

# Note: The 'dynamodb_table' parameter has been replaced with 'use_lockfile = true'
# which enables state locking using the default DynamoDB table name 'terraform_locks'.
# If you were using a custom table name, you'll need to ensure the table exists
# with the correct schema or continue using the 'dynamodb_table' parameter.
