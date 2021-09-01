output "role_arn" {
  description = "The ARN of created role"
  value       = module.iam_assumable_role.iam_role_arn
}

output "iam_instance_profile_arn" {
   description = "The ARN of Instance Profile."
    value       = module.iam_assumable_role.iam_instance_profile_arn
}