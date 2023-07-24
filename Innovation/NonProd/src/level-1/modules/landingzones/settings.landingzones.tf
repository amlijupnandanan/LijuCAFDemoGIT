locals {
  custom_landing_zones_innovation_np = {
    "mg-${var.root_id}-innovation-nonprod" = {
      display_name               = "Non-Production"
      parent_management_group_id = "mg-${var.root_id}-innovation"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "zee_innovation_nonprod"
        parameters     = {}
        access_control = {}
      }
    }
  }
}