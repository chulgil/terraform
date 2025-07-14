provider "aws" {
  region = "ap-northeast-2"
}

terraform {
	required_providers {
	aws = {
	  version = "~> 4.50.0"  # 안정적인 버전으로 다운그레이드
	}
  }
}
