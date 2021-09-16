provider "aws" {
  region = "ap-south-1"
  profile = "sk"
}

module "msk-cluster" {
  source  = "angelabad/msk-cluster/aws"
  version = "v0.3.5"

  cluster_name    = var.cluster_name
  instance_type   = var.instance_type
  number_of_nodes = var.number_of_nodes
  client_subnets  = var.client_subnets
  kafka_version   = var.kafka_version
  volume_size     = var.volume_size

  #extra security group to attach
  extra_security_groups = [module.msk_security_group.security_group_id]

  
  #s3 bucket to transer logs (should be already created)

  # s3_logs_bucket = var.s3_logs_bucket
  # s3_logs_prefix = "msklogs"

  #prometheus exporters & monitoring
  prometheus_jmx_exporter  = true
  prometheus_node_exporter = true

  enhanced_monitoring = var.enhanced_monitoring

  cloudwatch_logs_group = "${local.name}-msk-logs" #aws_cloudwatch_log_group.msk_logs.arn #(should be already created)
  

  server_properties = var.server_properties


  #encryption details
  encryption_in_transit_client_broker = "TLS"
  encryption_at_rest_kms_key_arn = aws_kms_key.msk_rest_key.arn
  encryption_in_transit_in_cluster = true

  tags = var.tags
  
}