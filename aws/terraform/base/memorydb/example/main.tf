terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

module "memory_db" {
  source = "../"

  name_prefix = "prod-us-west-2-redis"
  description = "Large MemoryDB for production environment in us-west-2."

  num_shards             = 3
  num_replicas_per_shard = 3

  subnet_ids = [
    "subnet-0bb1c79de3EXAMPLE",
    "subnet-0a9d2548bEXAMPLE"
  ]
  security_group_ids = [
    "sg-0e5e7d678EXAMPLE"
  ]
}
