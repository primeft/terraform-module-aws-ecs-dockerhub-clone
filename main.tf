locals {
  region     = var.region != null ? var.region : data.aws_region.current.name
  account_id = var.account_id != null ? var.account_id : data.aws_caller_identity.current.account_id
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
