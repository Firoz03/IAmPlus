provider "aws" {
  region = var.region
  profile = var.profile
}
resource "aws_eip" "nat" {
  count = 1
  vpc = true
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "v3.6.0 "

  #VPC
  name = var.name
  cidr = var.cidr
  azs  = var.azs
  tags = var.tags
  vpc_tags = var.vpc_tags
  #secondary_cidr_blocks = var.secondary_cidr_blocks


  #VPC DNS
  enable_dns_support = true
  enable_dns_hostnames = true 

  #IGW
  create_igw = true
  igw_tags = var.igw_tags
  create_egress_only_igw = var.create_egress_only_igw

  #Private subnets 
  private_subnets = var.private_subnets
  private_subnet_suffix = var.private_subnet_suffix
  private_subnet_tags = var.private_subnet_tags


  #public subnets
  public_subnets  = var.public_subnets
  public_subnet_suffix = var.public_subnet_suffix
  public_subnet_tags = var.public_subnet_tags
  map_public_ip_on_launch = var.map_public_ip_on_launch


  #route table tags
  public_route_table_tags = var.public_route_table_tags
  private_route_table_tags = var.private_route_table_tags


  #NAT GW
  reuse_nat_ips      = var.reuse_nat_ips                   # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module
  single_nat_gateway  = var.single_nat_gateway

  
}