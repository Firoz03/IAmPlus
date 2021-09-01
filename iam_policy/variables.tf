variable "region" {}

variable "profile" {}


variable "name_of_policy" {
  description = "The name of the policy"
  type        = string
  # default     = "Testing_Policy_2"
}

variable "path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     =  <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {
      "key1"="value1"
      "key2"="value2"
      "key3"="value3"
      "key4"="value4"

    }
}

