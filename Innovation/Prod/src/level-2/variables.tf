# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "ott"
}

variable "root_name" {
  type    = string
  default = "ott"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "uksouth"
}

variable "tf_storage_access_key" {
  type    = string
}
variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}