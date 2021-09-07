provider "aws" {
  region = var.region
  profile = var.profile
}

module "msk-cluster" {
  source  = "angelabad/msk-cluster/aws"
  version = "v0.3.5"

  cluster_name    = "iamplus-kafka-cluster"
  instance_type   = "kafka.t3.small"
  number_of_nodes =  2 #number of nodes should be multiplied of number of subnets
  client_subnets  = ["subnet-6fbbb807", "subnet-33a01a48"]
  kafka_version   = "2.6.2"
  volume_size = "20"

  #extra security group to attach
  extra_security_groups = ["sg-988168fc"]

  
  #s3 bucket to transer logs (should be already created)

  s3_logs_bucket = var.s3_logs_bucket
  s3_logs_prefix = "msklogs"

  #prometheus exporters & monitoring
  prometheus_jmx_exporter  = true
  prometheus_node_exporter = true

  enhanced_monitoring = var.enhanced_monitoring
  cloudwatch_logs_group = var.cloudwatch_logs_group #(should be already created)
  


  server_properties = {
    "auto.create.topics.enable"  = "true"
    "default.replication.factor" = "2"
  }


  #encryption details
  encryption_in_transit_client_broker = "TLS"
  #key should be present or default key will be used by msk
  encryption_at_rest_kms_key_arn = var.encryption_at_rest_kms_key_arn
  encryption_in_transit_in_cluster = true

  tags = var.tags
  
}