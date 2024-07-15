terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}



module "rds_sqlserver" {
  source = "terraform-aws-modules/rds/aws"


  identifier                     = "sqlserver-${var.context.application.name}-${var.context.resource.name}"
  instance_use_identifier_prefix = true

  engine               = "sqlserver-ex"
  engine_version       = "15.00"
  family               = "sqlserver-ex-15.0" # DB parameter group
  storage_encrypted    = false
  major_engine_version = "15.00" # DB option group
  instance_class       = "db.t3.large"
  license_model        = "license-included"
  timezone             = "GMT Standard Time"
  character_set_name   = "Latin1_General_CI_AS"

  username = "admin"
  password = "Password1234!"
  port     = 1433

  allocated_storage     = 20
  max_allocated_storage = 100

  // Optional metadata to associate Radius application context with the resource.

  tags = {
    "radius:environment" = var.context.environment.name
    "radius:application" = var.context.application.name
    "radius:resource"    = var.context.resource.name
  }

  // Configure networking based on the environment.
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = var.security_group_ids


}
