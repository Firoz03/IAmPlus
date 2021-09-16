# module "msk_security_group" {
#     source = "terraform-aws-modules/security-group/aws"
#     name = "${local.cluster_name}-security-group"
#     description = "Security Group for ${var.resource}"
#     vpc_id = var.vpc_id
#     ingress_cidr_blocks = [var.vpc_cidr]
#     egress_rules        = ["all-all"]
# }


module "msk_security_group" {
    source = "terraform-aws-modules/security-group/aws"
    name = "${local.name}-security-group"
    description = "Security Group for testing"
    vpc_id = "vpc-a08d68cb"
    ingress_cidr_blocks = ["172.31.0.0/16"]
    egress_rules        = ["all-all"]
}
