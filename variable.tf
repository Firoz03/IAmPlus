variable "create_group" {
  description = "Whether to create IAM group"
  type        = bool
  default     = true
}
variable "region" {
  description = "Default region for AWS"
  type        = string
  default = "us-east-1"
}
variable "groupname" {
  description = "Name of IAM group"
  type        = string
  default = "grp1"
}

variable "groupusername" {
  description = "name of the users"
  type        = list(string)
  default = [
      "user",
      "user4"

    ]
  
}
variable "custom_group_policy_arns" {
  description = "List of IAM policies ARNs to attach to IAM group"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

