locals {
  common_tags = merge(
    var.common_tags,
    {
      Module = "vpc"
    }
  )
}
