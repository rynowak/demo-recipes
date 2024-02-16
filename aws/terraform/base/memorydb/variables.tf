variable "name_prefix" {
  description = "Prefix for name of resources."
  type        = string
}

variable "description" {
  description = "Description of the resources."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "subnet_group_name" {
  description = "The existing subnet group to use."
  type        = string
}

variable "security_group_ids" {
  description = "This variable contains a list of security group IDs."
  type        = list(string)
}

variable "num_shards" {
  description = "The number of shards (1-32) to create."
  type        = number
  default     = 1
}

variable "num_replicas_per_shard" {
  description = "The number of replicas per shard (1-5) to create."
  type        = number
  default     = 2
}

variable "node_type" {
  description = "The kind of node to create"
  type        = string
  default     = "db.t4g.small"
}