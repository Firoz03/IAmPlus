provider "aws" {
  region = var.region
  profile = var.profile
}

module "iam_policy_1" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "v4.2.0"

  name        =  var.name_of_policy
  path        =  var.path
  description =  var.description
  policy = var.policy
  tags= var.tags

}

