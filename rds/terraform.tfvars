  username = "postgresadmin"
  password = "admin123"
  kms_key_id = ""
  subnet_ids = ["subnet-6fbbb807","subnet-33a01a48"]
  vpc_security_group_ids = ["sg-988168fc"]
 


  #tags
  db_parameter_group_tags  =  {
    
    "key1" = "value1"
  }

  db_option_group_tags =  {
        
        "key1" = "value2"
  }
  
  tags = {

      "key1" = "value2"
  }


  #parameter group
  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  