variable "settings" {
  description = "Data Factory configuration."
  type = object({
    resource_group_name             = string
    location                        = string
    data_factory_name               = string
    customer_managed_key_id         = optional(string, null)
    managed_virtual_network_enabled = optional(bool, false)
    public_network_enabled          = optional(bool, false)
    tags                            = optional(map(string), null)
    identity                        = string
    global_parameter_type           = string
    data_factory_pipelines_name     = string
    global_parameters = list(object({
      name  = string
      value = string
    }))
  })
}
