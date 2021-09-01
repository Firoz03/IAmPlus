region ="us-east-1"
profile = "srish"
name_of_policy="Testing-Policy-3"
path="/"
description = "This is sample policy to test"
policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
tags= {
      "key1"="value1"
      "key2"="value2"
      "key3"="value3"
      "key4"="value4"

    }