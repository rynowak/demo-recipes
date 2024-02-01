terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

// Generate a random string to use as a suffix. 
resource "random_id" "id" {
  byte_length = 8
}

locals {
  name        = "${var.name_prefix}-${random_id.id.hex}"
  description = var.description != null ? var.description : "Redis MemoryDB"
}

module "memory_db" {
  // Use an existing module from the Terraform Registry.
  source = "terraform-aws-modules/memory-db/aws"

  name        = local.name
  description = local.description
  tags        = var.tags

  // Redis settings
  create_parameter_group     = false
  parameter_group_name       = "default.memorydb-redis6"
  engine_version             = "6.2"
  auto_minor_version_upgrade = true
  node_type                  = "db.t4g.small"
  num_shards                 = var.num_shards
  num_replicas_per_shard     = var.num_replicas_per_shard
  maintenance_window         = "sun:23:00-mon:01:30"
  snapshot_retention_limit   = 7
  snapshot_window            = "05:00-09:00"

  // Authorization
  create_acl   = false
  create_users = false
  acl_name     = "open-access"


  // Networking
  subnet_ids               = var.subnet_ids
  security_group_ids       = var.security_group_ids
  subnet_group_name        = local.name
  subnet_group_description = local.description
}
