locals {
  configure_adls_resources = {
    settings = {
      location            = "centralindia"
      resource_group_name = "rg-devops-tfmodule-001"
      storageaccount_name = "dlzee5demo001"

      rules = {
        default_action             = "Deny"
        bypass                     = ["Metrics", "Logging", "AzureServices"]
        virtual_network_subnet_ids = ["/subscriptions/7520debb-fdca-454a-a2dd-db66458eeb14/resourceGroups/rg-devops-tfmodule-001/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"]
      }

      containers = [
        {
          name                  = "container1"
          container_access_type = "private"
        },
        {
          name                  = "container2"
          container_access_type = "blob"
        }
      ]
      file_shares = [
        {
          name        = "share1smb"
          quota_in_gb = 50
        }
      ]
      queues = [
        {
          name = "queue1"
        }
      ]


      tables = [
        {
          name = "table1"
        }
      ]
    }
  }
}
