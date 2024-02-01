output "cluster_endpoint_address" {
  description = "Address of the cluster endpoint"
  value       = module.memory_db.cluster_endpoint_address
}

output "cluster_endpoint_port" {
  description = "Port of the cluster endpoint"
  value       = module.memory_db.cluster_endpoint_port
}