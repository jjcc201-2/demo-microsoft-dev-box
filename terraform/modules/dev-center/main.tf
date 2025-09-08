# Dev Center
resource "azurerm_dev_center" "dev_center" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
}

# Dev Center role assignments for subscription-level permissions
resource "azurerm_role_assignment" "dev_center_contributor" {
  scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = azurerm_dev_center.dev_center.identity[0].principal_id
}

# Dev Center role assignments for user access administrator
resource "azurerm_role_assignment" "dev_center_user_access_admin" {
  scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  role_definition_name = "User Access Administrator"
  principal_id         = azurerm_dev_center.dev_center.identity[0].principal_id
}


# GitHub Catalog attached to Dev Center
resource "azurerm_dev_center_catalog" "dev_center_catalog" {
  name                = "dc_catalog"
  resource_group_name = var.resource_group_name
  dev_center_id       = azurerm_dev_center.dev_center.id

  catalog_github {
    branch            = "main"
    path              = var.github_path
    uri               = var.github_uri
    key_vault_key_url = var.github_pat_secret_id
  }
}

resource "azurerm_dev_center_dev_box_definition" "dc-dbd" {
  name               = var.db_def_name
  location           = var.location
  tags                = var.tags
  dev_center_id      = azurerm_dev_center.dev_center.id
  image_reference_id = "${azurerm_dev_center.dev_center.id}/galleries/default/images/${var.dev_box_image}" 
  sku_name           = var.dev_box_sku
}


resource "azurerm_dev_center_network_connection" "network-connection" {
  name                = var.network_connection_name
  resource_group_name = var.resource_group_name
  location            = var.location
  domain_join_type    = "AzureADJoin"
  subnet_id           = var.subnet_id
}

resource "azurerm_dev_center_attached_network" "dc-attached-network" {
  name                  = var.attached_network_name
  dev_center_id         = azurerm_dev_center.dev_center.id
  network_connection_id = azurerm_dev_center_network_connection.network-connection.id
}

resource "azurerm_dev_center_project_pool" "dc-dev-pool" {
  name                                    = var.dev_pool_name
  location                                = var.location
  dev_center_project_id                   = var.project_id
  dev_box_definition_name                 = azurerm_dev_center_dev_box_definition.dc-dbd.name
  local_administrator_enabled             = true
  stop_on_disconnect_grace_period_minutes = 60
  dev_center_attached_network_name        = azurerm_dev_center_attached_network.dc-attached-network.name
}

data "azurerm_client_config" "current" {}