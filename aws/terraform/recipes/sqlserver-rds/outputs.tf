output "result" {
  description = "Output of the recipe. These values will be used to configure the connection."
  sensitive = true

  value = {
    values = {
      database = module.rds_sqlserver.db_instance_name
      host     = module.rds_sqlserver.db_instance_address
      port     = module.rds_sqlserver.db_instance_port
      username = module.rds_sqlserver.db_instance_username
      password = "Password1234!"
    }
  }
}