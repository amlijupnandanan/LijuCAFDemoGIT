data "azuread_client_config" "current" {}
resource "azurerm_data_factory" "this" {
  name                            = var.settings.data_factory_name
  location                        = var.settings.location
  resource_group_name             = var.settings.resource_group_name
  customer_managed_key_id         = var.settings.customer_managed_key_id
  managed_virtual_network_enabled = var.settings.managed_virtual_network_enabled
  public_network_enabled          = var.settings.public_network_enabled
  identity {
    type = var.settings.identity
  }
  dynamic "global_parameter" {
    for_each = var.settings.global_parameters
    content {
      name  = global_parameter.value.name
      value = global_parameter.value.value
      type  = var.settings.global_parameter_type
    }
  }
  tags = var.settings.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
# resource "azurerm_data_factory_pipeline" "this" {
#   name            = var.settings.data_factory_pipelines_name
#   data_factory_id = azurerm_data_factory.this.id
#   variables = {
#     "bob" = "item1"
#   }
#   activities_json = <<JSON
# [
#     {
#         "name": "Append variable2",
#         "type": "AppendVariable",
#         "dependsOn": [],
#         "userProperties": [],
#         "typeProperties": {
#           "variableName": "bob",
#           "value": "something"
#         }
#     }
# ]
#   JSON
# }
resource "azurerm_data_factory_pipeline" "pipeline3" {
  name            = "Pipeline4"
  data_factory_id = azurerm_data_factory.this.id
  # variables = {
  #   "bob" = "item4"
  # }
  activities_json = jsonencode([jsondecode(file("${path.module}/pipeline/append_pipeline1.json"))])
}

/*
resource "azurerm_data_factory_pipeline" "CopyDataFromstgTF01" {
  name            = "CopyDataFromstgTF01"
  data_factory_id = azurerm_data_factory.this.id
  activities_json = jsonencode([jsondecode(file("${path.module}/pipeline/demo.json"))])
   
}

#Linked service of CopyDataFromstgTF01

resource "azurerm_storage_account" "adf_storage01" {
  name                     = "stgdemoottadf01"
  resource_group_name      = var.settings.resource_group_name
  location                 = var.settings.location
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"
  tags = {
    environment = "dev"
    do          = "delete"
  }
}
#Container 1 source01
resource "azurerm_storage_container" "adf_storage_stgsource_01" {
  name                  = "source01"
  storage_account_name  = azurerm_storage_account.adf_storage01.name
  container_access_type = "private"
}

#Container2 destination01
resource "azurerm_storage_container" "adf_storage_stgtarget_01" {
  name                  = "destination01"
  storage_account_name  = azurerm_storage_account.adf_storage01.name
  container_access_type = "private"
}
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf_blob_link_02" {
  name                = "adfbloblink02"
  data_factory_id = azurerm_data_factory.this.id
  connection_string   = azurerm_storage_account.adf_storage01.primary_connection_string

}
resource "azurerm_data_factory_dataset_azure_blob" "adf_ds_blob_001" {
  name                = "dsSource"
  data_factory_id = azurerm_data_factory.this.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.adf_blob_link_02.name
  path                = azurerm_storage_container.adf_storage_stgsource_01.name

 }

resource "azurerm_data_factory_dataset_azure_blob" "adf_ds_blob_002" {
  name                = "dsDestination"
  data_factory_id = azurerm_data_factory.this.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.adf_blob_link_02.name
  path                = azurerm_storage_container.adf_storage_stgtarget_01.name

}

resource "azurerm_data_factory_pipeline" "adf_pipeline_02" {
  name                = "CopyData"
  data_factory_id = azurerm_data_factory.this.id
  activities_json = jsonencode([jsondecode(file("${path.module}/pipeline/demo.json"))])
}

*/




# resource "azurerm_resource_group_template_deployment" "adfpipeline2" {
#   name                     = "adfpipeline2-deploy"
#   resource_group_name      = var.settings.resource_group_name
#   deployment_mode          = "Incremental"  
#   template_content        =jsonencode(jsondecode(file("${path.module}/pipeline/extract_ARM_storage1.json")))
 
#    parameters_content = jsonencode({
#     "factoryName" = {
#       value = "${var.settings.data_factory_name}"
#     },
#     "storagelinkedservice1": {
#       value="storagelinkedservice1"
#     }
#   })
# }

resource "azurerm_storage_account" "adf_storage" {
  name                     = "adftfdemostg01"
  resource_group_name      = var.settings.resource_group_name
  location                 = var.settings.location
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"
  tags = {
    environment = "dev"
    do          = "delete"
  }
}


/* With linked service  */
resource "azurerm_storage_container" "adf_storage_source_01" {
  name                  = "adfstoragesource01"
  storage_account_name  = azurerm_storage_account.adf_storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "adf_storage_target_01" {
  name                  = "adfstoragetarget01"
  storage_account_name  = azurerm_storage_account.adf_storage.name
  container_access_type = "private"
}
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf_blob_link_01" {
  name                = "adfbloblink01"
  data_factory_id = azurerm_data_factory.this.id
  connection_string   = azurerm_storage_account.adf_storage.primary_connection_string

}
resource "azurerm_data_factory_dataset_azure_blob" "adf_ds_blob_01" {
  name                = "adfdsblob01"
  data_factory_id = azurerm_data_factory.this.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.adf_blob_link_01.name
  path                = azurerm_storage_container.adf_storage_source_01.name

 }

resource "azurerm_data_factory_dataset_azure_blob" "adf_ds_blob_02" {
  name                = "adfdsblob02"
  data_factory_id = azurerm_data_factory.this.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.adf_blob_link_01.name
  path                = azurerm_storage_container.adf_storage_target_01.name

}

resource "azurerm_data_factory_pipeline" "adf_pipeline_01" {
  name                = "adfpipeline01"
  data_factory_id = azurerm_data_factory.this.id
  activities_json = jsonencode([jsondecode(file("${path.module}/pipeline/storage_task.json"))])
}