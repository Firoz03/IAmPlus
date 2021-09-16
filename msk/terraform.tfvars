cluster_name = "iamplus-testing-cluster"
kafka_version = "2.6.2"
instance_type = "kafka.t3.small"
number_of_nodes = 2
client_subnets = ["subnet-6fbbb807", "subnet-33a01a48"]
# extra_security_groups = ["sg-988168fc"]
enhanced_monitoring = "PER_BROKER"
volume_size = 20
tags={
    Owner       = "user"
    Environment = "dev"
  }

server_properties = {
    "auto.create.topics.enable"  = "true"
    "default.replication.factor" = "2"
  }

# cloudwatch_logs_group = "iamplus-testing-loggroup"
