output "result" {
  description = "Output of the recipe. These values will be used to configure the connection."

  value = {
    values = {
      host = module.memory_db.cluster_endpoint_address
      port = module.memory_db.cluster_endpoint_port
    }
  }
}