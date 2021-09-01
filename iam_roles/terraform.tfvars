create_role = true
role_name = "Tesitng_role"
role_description = "This is the testing role to test"
custom_role_policy_arns =  [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    ]
number_of_custom_role_policy_arns = 1
trusted_role_services = []
tags = {
  "key1" = "value1"
}