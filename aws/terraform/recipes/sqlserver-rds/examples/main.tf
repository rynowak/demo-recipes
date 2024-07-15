module "sqlserver_rds" {
  source = "../"

  subnet_group_name  = "prod-aws"
  security_group_ids = ["sg-03f7a8deeb5e1fc32"]
  context = {
    application = {
      name = "test-app"
    }
    environment = {
      name = "prod-aws"
    }
    resource = {
      name = "test-db"
    }
  }
}