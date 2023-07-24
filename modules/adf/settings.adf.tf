locals {
  configure_adf_resources = {
    settings = {
      location                        = "centralindia"
      resource_group_name             = "rg-devops-tfmodule-001"
      data_factory_name               = "adf-data-nonprod-001"
      identity                        = "SystemAssigned"
      global_parameter_type           = "String"
      customer_managed_key_id         = null
      managed_virtual_network_enabled = false
      public_network_enabled          = false
      tags                            = null
      data_factory_pipelines_name     = "Pipeline1"
      global_parameters = [
        {
          name  = "Param1"
          value = "test1"
        },
        {
          name  = "Param2"
          value = "Test2"
        }
      ]
    }
  }
}
