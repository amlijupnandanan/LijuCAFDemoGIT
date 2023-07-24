locals {
  custom_landing_zones_innovation = {
    "mg-${var.root_id}-innovation" = {
      display_name               = "Zee Innovation"
      parent_management_group_id = "${var.root_parent_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }

    "mg-${var.root_id}-innovation-prod" = {
      display_name               = "Production"
      parent_management_group_id = "mg-${var.root_id}-innovation"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }    
  }
}