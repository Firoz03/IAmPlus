variable "name" {
  description = "Desired name for the IAM user"
  type        = string
  default     = "user2"
}
variable "region" {
  description = "Default region for AWS"
  type        = string
  default = "us-east-1"
}
