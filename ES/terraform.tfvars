kms_key_id = "arn:aws:kms:us-east-1:123456789101:key/cccc103b-4ba3-5993-6fc7-b7e538b25fd8"
custom_endpoint_certificate_arn = "arn:aws:acm:us-east-1:123456789101:certificate/abcd1234-ef11-abcd-1234-abcd1234efef"
#cloudwatch_log_group_arn = "arn:aws:logs:us-east-1:123456789101:log-group:/aws/elasticsearch/index_slow_logs:*"

#warm count
warm_count = 3
warm_enabled = false
warm_type = "ultrawarm1.medium.elasticsearch"
create_service_link_role = true 
tls_security_policy = "Policy-Min-TLS-1-2-2019-07"