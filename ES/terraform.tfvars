kms_key_id = ""
custom_endpoint_certificate_arn = ""

#warmtype detaisl
warm_count = 3
warm_enabled = true
warm_type = "ultrawarm1.medium.elasticsearch"
create_service_link_role = true 
tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
tags={
    Owner = "sysops"
    env   = "test"
  }

#security group & subnets
security_group_ids = ["sg-988168fc"]
subnet_ids = ["subnet-6fbbb807","subnet-33a01a48"]

#security
# master_user_username = "masteruser"
# master_user_password = "demopassword"

# access_policies = <<EOF 
# {
#     "Version": "2012-10-17",
#     "Statement": [{
#         "Effect": "Allow",
#         "Principal": {
#         "AWS": [
#             "arn:aws:iam::987654321098:user/test-user"
#         ]
#         },
#         "Action": [
#         "es:ESHttp*"
#         ],
#         "Condition": {
#         "IpAddress": {
#             "aws:SourceIp": [
#             "192.0.2.0/24"
#             ]
#         }
#         },
#         "Resource": "arn:aws:es:us-west-1:987654321098:domain/iamplus-elasticsearch/*"
#     }]
# }
# EOF