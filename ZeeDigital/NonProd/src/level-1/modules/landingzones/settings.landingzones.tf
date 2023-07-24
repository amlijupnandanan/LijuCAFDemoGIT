locals {
  custom_landing_zones_digital_np = {
    "mg-${var.root_id}-digital-nonprod" = {
      display_name               = "Non-Production"
      parent_management_group_id = "mg-${var.root_id}-digital"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "non_prod"
        parameters     = {}
        access_control = {}
      }
    }
  }
}