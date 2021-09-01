provider "aws" {
  region = var.region
  profile = var.profile
}

module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "v4.2.0"

 
  create_role = var.create_role


  #role details
  role_name = var.role_name
  role_description = var.role_description


  #trusted roles
  trusted_role_arns = var.trusted_role_arns
  trusted_role_services = var.trusted_role_services

  #custom policies
  custom_role_policy_arns = var.custom_role_policy_arns
  number_of_custom_role_policy_arns = var.number_of_custom_role_policy_arns

  #tags
  tags = var.tags

 
  

}
