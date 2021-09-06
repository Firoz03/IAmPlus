provider "aws" {
  region = "us-east-2"
  profile = "US_radhika"
}
module "aws_es" {

  source  = "lgallard/elasticsearch/aws"
  version = "0.12.0"

  domain_name           = "iamplus-elasticsearch"
  elasticsearch_version = "7.1"

  cluster_config = {
    dedicated_master_enabled = true
    instance_count           = 3
    instance_type            = "r5.large.elasticsearch"
    zone_awareness_enabled   = true
    availability_zone_count  = 3
   
    #warm options
    warm_count = var.warm_count
    warm_enabled = var.warm_enabled
    warm_type = var.warm_type
    create_service_link_role = var.create_service_link_role
  }

  ebs_options = {
    ebs_enabled = "true"
    volume_size = "25"
    volume_type = "gp2"
    # iops = ""
  }

  encrypt_at_rest = {
    enabled    = true
    kms_key_id = var.kms_key_id
  }

  log_publishing_options = {
        
        index_slow_logs = {
            enabled                          = true
            cloudwatch_log_group_arn         = "arn:aws:logs:us-east-1:123456789101:log-group:/aws/elasticsearch/index_slow_logs:*"
            log_publishing_options_retention = 90
            }
        search_slow_logs = {
            enabled                  = true
            cloudwatch_log_group_arn = "arn:aws:logs:us-east-1:123456789101:log-group:/aws/elasticsearch/search_slow_logs:*"
            }
        es_application_logs = {
            enabled                   = true
            cloudwatch_log_group_name = "es_application_logs_dev" 
            }
        audit_logs = {
            enabled                   = false
            cloudwatch_log_group_name = "audit_logs_dev"
            }
    }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = true
  }

  domain_endpoint_options = {
    enforce_https                   = true
    custom_endpoint_enabled         = true
    custom_endpoint                 = "iamplus"
    custom_endpoint_certificate_arn = var.custom_endpoint_certificate_arn
    tls_security_policy = var.tls_security_policy
  }

  node_to_node_encryption_enabled                = true
  snapshot_options_automated_snapshot_start_hour = 23

  tags = {
    Owner = "sysops"
    env   = "dev"
  }

}