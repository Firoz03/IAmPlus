provider "aws" {
  region = "ap-south-1"
  profile = "sk"
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "v3.3.0"

  #name of postgresql
  identifier = "iamplustesting-rds"
 
  #postgresql variables according to SIT environment
  engine               = "postgres"
  engine_version       = "9.6.22"
  family               = "postgres9.6" # DB parameter group
  major_engine_version = "9.6"         # DB option group
  instance_class       = "db.m5.xlarge"
  allocated_storage     = 200
  max_allocated_storage = 1000 #need to decide
  storage_encrypted     = true
  
  #Setting this implies a storage_type of 'io1'
  iops = "0"


  #db name, username & password
  name     = "postgreDB" #databasename
  username = var.username
  password = var.password
  port     = 5432

  #according to SIT env 
  maintenance_window              = "fri:00:00-fri:03:00"
  backup_window                   = "03:00-06:00"


  #networking details
  multi_az               =  true
  subnet_ids             =  var.subnet_ids
  vpc_security_group_ids =  var.vpc_security_group_ids
  create_db_subnet_group =  true
  cross_region_replica = false #need to decide



  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  

  #Determines whether a final DB snapshot is created before the DB instance is deleted
  skip_final_snapshot     = false
  final_snapshot_identifier = "name-of-the-final-snapshot"
  final_snapshot_identifier_prefix = "final-snapshot-prefix"
  backup_retention_period = 7 #(in days)

 
  
  #monitoring details

  #because performance insights is not enabled in postgres 9.6 version
#   performance_insights_enabled          = true
#   performance_insights_kms_key_id  =      var.performance_insights_kms_key_id
#   performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   =  60 #in seconds
  monitoring_role_name                  = "iamplus-monitoring-role-name"
  

  
  #tags
  tags = var.tags
  db_option_group_tags = var.db_option_group_tags
  db_parameter_group_tags = var.db_parameter_group_tags
  
   

  #hardcoded varibles need to decide
  delete_automated_backups = false #delete backups after engine is deleted
  deletion_protection     = true #should be true at final db instance
  iam_database_authentication_enabled = true
  allow_major_version_upgrade = false


  kms_key_id = var.kms_key_id

  #paramter groups
  parameter_group_name = "iamplus-testing-parametergroup"
  parameter_group_use_name_prefix = true
  parameter_group_description = "parameter_group_description"
  parameters = var.parameters


  #because postgresql not supports options groups it supports extention and modules.
  create_db_option_group  = false
 
}
