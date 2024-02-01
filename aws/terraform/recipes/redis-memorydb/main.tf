terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

module "memory_db" {
  // Use an existing module we developed in-house :-D
  source = "../../base/memorydb"

  name_prefix = "redis-${var.context.application.name}-${var.context.resource.name}"

  // Optional metadata to associate Radius application context with the resource.
  description = "Redis in environment ${var.context.environment.name} for ${var.context.application.name}:${var.context.resource.name}"
  tags = {
    "radius:environment" = var.context.environment.name
    "radius:application" = var.context.application.name
    "radius:resource"    = var.context.resource.name
  }

  // Configure networking based on the environment.
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
}
