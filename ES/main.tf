provider "aws" {
  region = "ap-south-1"
  profile = "sk"
}
module "aws_es" {

  source  = "lgallard/elasticsearch/aws"
  version = "0.12.0"

  domain_name           = "iamplus-elasticsearch"
  elasticsearch_version = "7.1"

  cluster_config = {

    #masters details
    dedicated_master_enabled = true
    dedicated_master_count = 3
    dedicated_master_type  = "t3.small.elasticsearch"

    #instance details
    instance_count           = 3
    instance_type            = "t3.small.elasticsearch"


    zone_awareness_enabled   = true
    availability_zone_count  = 3
   
    #warm options
    warm_count = var.warm_count
    warm_enabled = var.warm_enabled
    warm_type = var.warm_type
    create_service_link_role = var.create_service_link_role
  }

  advanced_security_options = {

    enabled = true
    internal_user_database_enabled = true
    master_user_username = "master"
    master_user_password = "T0p$ecret"
        
  }

  vpc_options = {
    security_group_ids = var.security_group_ids
    subnet_ids = var.subnet_ids
  }

  ebs_options = {
    ebs_enabled = "true"
    volume_size = "20"
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
            cloudwatch_log_group_name         = "es_index_logs"
            retention = 90 #in days
            }
        search_slow_logs = {
            enabled                  = true
            cloudwatch_log_group_name = "es_search_logs"
          

            }
        es_application_logs = {
            enabled                   = true
            cloudwatch_log_group_name = "es_application_logs" 
            
            }
        #apply only when advanced security options enabled
        audit_logs = {
            enabled                   = true
            cloudwatch_log_group_name = "audit_logs"
            
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

  cloudwatch_log_enabled = true

  node_to_node_encryption_enabled                = true
  snapshot_options_automated_snapshot_start_hour = 23

  tags = var.tags
  #access_policies = var.access_policies
  
}