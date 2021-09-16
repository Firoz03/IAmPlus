resource "aws_kms_key" "msk_rest_key" {
  description             = local.msk_kms_description
  deletion_window_in_days = 10
  enable_key_rotation     = true
  policy = <<POLICY
{
 "Version": "2012-10-17",
    "Id": "key-default-1",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "logs.ap-south-1.amazonaws.com"
            },
            "Action": [
                "kms:Encrypt*",
                "kms:Decrypt*",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:Describe*"
            ],
            "Resource": "*"
        }    
    ]
}
POLICY
#need to change the region and principal in above policy
  tags                    = local.tags
}

