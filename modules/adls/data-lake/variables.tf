variable "settings" {
  description = "Storage account configurations"
  type = object({
    storageaccount_name      = string
    location                 = string
    resource_group_name      = string
    account_kind             = optional(string, "StorageV2")
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "GRS")
    

    rules = object({
      default_action             = string
      bypass                     = list(string)
      virtual_network_subnet_ids = list(string)
    })

    containers = list(object({
      name                  = string
      container_access_type = optional(string, "private")
    }))

    file_shares = list(object({
      name             = string
      quota_in_gb      = optional(number, 50)
      enabled_protocol = optional(string)
      metadata         = optional(map(string))
      acl = optional(list(object({
        id          = string
        permissions = string
        start       = optional(string)
        expiry      = optional(string)
      })))
    }))

    queues = list(object({
      name = string
    }))

    tables = list(object({
      name = string
    }))

  })
}
