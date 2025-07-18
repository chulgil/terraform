terraform {
  backend "s3" {
    bucket         = "test-s3-tf-state-421114334882"
    key            = "prod/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "test-ddb-tf-lock"
    encrypt        = true
  }
}
