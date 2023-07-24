locals {
  custom_landing_zones = {
    "mg-${var.root_id}-digital" = {
      display_name               = "Zee Digital"
      parent_management_group_id = "${var.root_parent_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }

    "mg-${var.root_id}-digital-prod" = {
      display_name               = "Production"
      parent_management_group_id = "mg-${var.root_id}-digital"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "zee_digital_prod"
        parameters     = {}
        access_control = {}
      }
    }
  }
}