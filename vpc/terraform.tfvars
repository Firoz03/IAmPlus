########################################COMMON VARIABLE FOR ALL RESOURCES ##############################

tags = {
    "keyall"="valueall"
}
create_vpc= true

############################################## VPC, CIDR & AZS #########################################

name = "Testing_VPC"
cidr = "11.0.0.0/16"
azs= ["us-east-1a", "us-east-1b", "us-east-1a"]
vpc_tags = {
  "key1" = "vpc"
}
secondary_cidr_blocks = [ "value" ]


############################################### VPC DNS  #########################################

enable_dns_support = true
enable_dns_hostnames = true

############################################## Default Route Tables  #########################################

default_route_table_routes = [ {
  "key" = "value"
} ]
default_route_table_tags = {
  "key" = "value"
}
###################################### Default Security Group #######################################

manage_default_security_group = true
default_security_group_name = "testing_sg_iam+"

default_security_group_ingress = [ {
  "key" = "value"
} ]
default_security_group_egress = [ {
  "key" = "value"
} ]

default_security_group_tags = {
  "resource" = "sg"
}
###################################### Default Network ACL Ingress #######################################

default_network_acl_name = "testing_acl"

default_network_acl_egress = [ {
  "key" = "value"
} ]

default_network_acl_tags = {
  "key" = "value"
}

default_network_acl_ingress = [ {
  "key" = "value"
} ]

###################################### IGW #########################################

create_igw = true
igw_tags = {
  "key" = "igw"
}
create_egress_only_igw = true

######################################### NAT GATWAY ##################################

single_nat_gateway = true
nat_gateway_tags = {
  "key" = "natgw"
}

################################################### NAT EIP  #########################################

nat_eip_tags = {
  "key" = "natEIPs"
}
reuse_nat_ips = false

############################################## PRIVATE SUBNETS  ##################################

private_subnets = [ "11.0.1.0/24", "11.0.2.0/24" ]
private_subnet_suffix = "private"
private_subnet_tags = {
  "key" = "private subnets"
}

############################################## PRIVATE SUBNETS ACLs ##################################

private_dedicated_network_acl = false
private_inbound_acl_rules = [ 
        {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
 ]

public_outbound_acl_rules = [ 
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },

]
private_acl_tags = {
  "key" = "private_acl_tags"
}


######################################### PUBLIC SUBNETS  ##################################

public_subnets =  [ "11.0.3.0/24", "11.0.4.0/24" ]
public_subnet_suffix = "public"
public_subnet_tags = {
  "key" = "public_subnets"
}
map_public_ip_on_launch = true

######################################### PUBLIC SUBNETS ACLs ##################################

public_dedicated_network_acl = false
public_inbound_acl_rules = [ 
   {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
]

private_outbound_acl_rules = [ {
  rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    } 
]

public_acl_tags = {
  "key" = "public acl tags"
}

############################################## DATABASE SUBNETS ######################################

create_database_internet_gateway_route = false
create_database_nat_gateway_route = false

create_database_subnet_group = false
create_database_subnet_route_table = false

database_acl_tags = {
  "key" = "database_acl"
}
database_dedicated_network_acl = false
database_inbound_acl_rules = [ 
  {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
 ]

database_outbound_acl_rules = [ 
  {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
 ]


database_route_table_tags = {
  "key" = "route table"
}

database_subnet_group_name = "db_subnet_group"
database_subnet_group_tags = {
  "key" = "db_subnet_group_tags"
}

database_subnet_suffix = "db"
database_subnet_tags = {
  "key" = "db_subnets"
}
database_subnets = [ "value" ]

################################### PUBLIC AND PRIVATE ROUTE TABLES ###############################

public_route_table_tags = {
  "key" = "public_route_table"
}
private_route_table_tags = {
  "key" = "private_route_table"
}

######################################## VPC FLOW LOGS #############################################

enable_flow_log = false
vpc_flow_log_permissions_boundary = "value"

vpc_flow_log_tags = {
  "key" = "vpc_flow_logs"
}

######################################## DHCP Options #############################################

enable_dhcp_options = false
dhcp_options_domain_name = "value"
dhcp_options_domain_name_servers = [ "value" ]

