variable "name" {
  description = "Desired name for the IAM user"
  type        = string
}
variable "region" {
  description = "Default region for AWS"
  type        = string
  default = "us-east-1"
}