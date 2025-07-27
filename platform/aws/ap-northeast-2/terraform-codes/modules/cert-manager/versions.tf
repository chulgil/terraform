terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0, >= 1.14.0, < 2.0.0"
    }
  }
}
