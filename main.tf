provider "aws" {
  region = var.region
  //profile = var.profile
}

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name          = var.name
  force_destroy = true
  password_reset_required = false
}
