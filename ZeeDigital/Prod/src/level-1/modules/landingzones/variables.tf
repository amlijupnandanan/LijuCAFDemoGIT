variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = "centralindia"
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
  default     = "southindia"
}

variable "root_parent_id" {
  type        = string
  description = "Give the parrent id which already present in the azure"
}
