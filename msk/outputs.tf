output "arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = module.msk-cluster.arn
}

output "encryption_at_rest_kms_key_arn" {
  description = "The ARN of the KMS key used for encryption at rest of the broker data volumes."
  value = module.msk-cluster.encryption_at_rest_kms_key_arn
}