variable "context" {
  description = "This variable contains the Radius recipe context."
  type        = any
}

variable "subnet_group_name" {
  description = "The existing subnet group to use."
  type        = string
}

variable "security_group_ids" {
  description = "This variable contains a list of security group IDs."
  type        = list(string)
}