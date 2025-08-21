resource "azurerm_dev_center_project" "project" {
  dev_center_id       = var.dev_center_id
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  maximum_dev_boxes_per_user = 3
}

# Assign role for Dev Project which enables usage of Dev Box
resource "azurerm_role_assignment" "dev_project_role_access" {
  scope                = azurerm_dev_center_project.project.id
  role_definition_name = "DevCenter Dev Box User"
  principal_id         = var.developers_group_object_id
}

