variable "context" {
  description = "This variable contains the Radius recipe context."
  type        = any
}

variable "subnet_ids" {
  description = "This variable contains a list of subnet IDs."
  type        = list(string)
}

variable "security_group_ids" {
  description = "This variable contains a list of security group IDs."
  type        = list(string)
}