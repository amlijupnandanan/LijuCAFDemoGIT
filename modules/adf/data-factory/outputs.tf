output "name" {
  description = "The name of the Data Factory created."
  value       = azurerm_data_factory.this.name
}
output "id" {
  description = "The ID of the Data Factory created."
  value       = azurerm_data_factory.this.id
}
# output "data_factory_pipeline_name" {
#   description = "The ID of the Data Factory Pipeline created."
#   value       = azurerm_data_factory_pipeline.this.name
# }
