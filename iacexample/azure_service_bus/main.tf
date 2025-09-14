# main.tf
# Purpose: Defines Azure Service Bus namespace, topics, queues, subscriptions, and managed identity integration.

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "sb_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_servicebus_namespace" "sb" {
  name                = var.servicebus_namespace_name
  location            = azurerm_resource_group.sb_rg.location
  resource_group_name = azurerm_resource_group.sb_rg.name
  sku                 = var.sku
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

resource "azurerm_servicebus_topic" "sb_topic" {
  count               = var.topic_count
  name                = "${var.topic_name_prefix}${count.index + 1}"
  namespace_name      = azurerm_servicebus_namespace.sb.name
  resource_group_name = azurerm_resource_group.sb_rg.name
}

resource "azurerm_servicebus_queue" "sb_queue" {
  count               = var.queue_count
  name                = "${var.queue_name_prefix}${count.index + 1}"
  namespace_name      = azurerm_servicebus_namespace.sb.name
  resource_group_name = azurerm_resource_group.sb_rg.name
}

resource "azurerm_servicebus_subscription" "sb_subscription" {
  count               = var.subscription_count
  name                = "${var.subscription_name_prefix}${count.index + 1}"
  topic_name          = azurerm_servicebus_topic.sb_topic[count.index % var.topic_count].name
  namespace_name      = azurerm_servicebus_namespace.sb.name
  resource_group_name = azurerm_resource_group.sb_rg.name
}

# Remote backend configuration is in backend.tf
