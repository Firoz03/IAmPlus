provider "aws" {
  region = var.region
  profile = var.profile
}

module "eks_cluster" {

  source          = "terraform-aws-modules/eks/aws"
  version         =  "v17.6.0"

  #cluster details
  cluster_name    =  "IAMplus_Testing_cluster"
  cluster_version =  "1.20"

  #VPC & subnets
  subnets         = ["subnet-0ac51866a0ddb81bb", "subnet-0461ecf4bb40f39cc", "subnet-01dcbbff9014ab8e9"]
  vpc_id          = "vpc-0a32d1f162fe203ed"

  #networking vairables
  attach_worker_cni_policy = false
  cluster_egress_cidrs = [ "0.0.0.0/0" ]

  #endpoint access
  cluster_endpoint_public_access = false
  cluster_endpoint_private_access = true

  #roles
  manage_cluster_iam_resources = false
  manage_worker_iam_resources = true

  cluster_iam_role_name = "drewry_testing_ekscluster_role"
  workers_role_name  = "drewry_testing_workernode_role"

  ##additional roles

  # map_roles = [
  #       {
  #           rolearn  = "arn:aws:iam::66666666666:role/role1"
  #           username = "role1"
  #           groups   = ["system:masters"]
  #       },
  #       {
  #           rolearn  = "arn:aws:iam::66666666666:role/role1"
  #           username = "role1"
  #           groups   = ["system:masters"]
  #       },

  # ] 
  # map_users = [

  #     {
  #           userarn  = "arn:aws:iam::66666666666:user/user1"
  #           username = "user1"
  #           groups   = ["system:masters"]
  #     },
  #     {
  #           userarn  = "arn:aws:iam::66666666666:user/user2"
  #           username = "user2"
  #           groups   = ["system:masters"]
  #     },
  # ]

  
  cluster_enabled_log_types = ["api","audit","authenticator","controllerManager","scheduler"]
  cluster_create_security_group = false
  # cluster_security_group_id= ""
  

  
  
   worker_groups = [
      {
        name = "IAM_testing_worker_node"
        name_prefix = "omega-core"
        instance_type = "t2.micro" #var.instance_type
        ami_id =""
        # ami_type = "AL2_x86_64" #var.ami_type
        subnets = ["subnet-0ac51866a0ddb81bb","subnet-0461ecf4bb40f39cc"]
        taints = ""
        version = ""

        ##instane count
        asg_max_size  = var.asg_max_size
        asg_min_size = var.asg_min_size
        asg_desired_capacity = var.asg_desired_capacity
      
        # capacity_type = ON_DEMAND
        # create_launch_template = true
      
        # disk_encrypted = true
        # disk_kms_key_id = ""
        # disk_size = "20GB"
        # disk_type = "gp3"
        # ebs_optimized  = true
        #iam_role_arn = "testing_role"
        tags = [
            {
              key                 = "ExtraTag1"
              value               = "TagValue1"
              propagate_at_launch = true
            },
            {
              key                 = "ExtraTag2"
              value               = "TagValue2"
              propagate_at_launch = true
            },
            {
              key                 = "ExtraTag3"
              value               = "TagValue3"
              propagate_at_launch = true
            },
        ]

        #volume type
        root_volume_size       = 150
        root_volume_type       = "gp3"
        root_volume_throughput = 300
        root_iops = ""
        ebs_optimized = "true"

        key_name  = ""
        enable_monitoring  = "true"
        kubelet_extra_args = ""
        
        #iam roles
        iam_role_id =  ""
        iam_instance_profile_name = ""
        service_linked_role_arn  = ""
      

      },
  ]

}
