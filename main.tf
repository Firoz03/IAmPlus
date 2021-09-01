module "iam_group_with_policies" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 3.0"

  name = var.groupname

  group_users = var.groupusername

  attach_iam_self_management_policy = true

 custom_group_policy_arns = var.custom_group_policy_arns

  custom_group_policies = [
    {
      name   = "AllowS3Listing"
      policy = data.aws_iam_policy_document.sample.json
    }
  ]
}

