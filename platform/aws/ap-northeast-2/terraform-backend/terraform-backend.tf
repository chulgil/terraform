resource "aws_s3_bucket" "test-s3-tf-state" {
  # 접두사나 접미사에 타임스탬프나 계정 ID를 추가하여 고유성 보장
  bucket = "test-s3-tf-state-${data.aws_caller_identity.current.account_id}"
  
  tags = {
    "Name" = "test-s3-tf-state"
  }
}

resource "aws_dynamodb_table" "test-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "test-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "test-ddb-tf-lock"
  }

}

# 현재 AWS 계정 정보를 가져오기 위한 데이터 소스
data "aws_caller_identity" "current" {}