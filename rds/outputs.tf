output "db_instance_endpoint" {
  value = module.db.db_instance_endpoint
}

output "db_instance_name" {
  value = module.db.db_instance_name
}

output "db_instance_address" {
  value = module.db.db_instance_address
}

output "db_instance_arn" {
  value = module.db.db_instance_arn
}

output "db_instance_availability_zone" {
  value = module.db.db_instance_availability_zone
}

output "db_parameter_group_arn" {
 value = module.db.db_parameter_group_arn 
}

output "enhanced_monitoring_iam_role_name" {
  value = module.db.enhanced_monitoring_iam_role_name
}

output "db_option_group_arn" {
  value = module.db.db_option_group_arn
}