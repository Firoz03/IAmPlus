output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.iam_policy_1.arn
}

output "name" {
  description = "The name of the policy"
  value       = module.iam_policy_1.name
}

