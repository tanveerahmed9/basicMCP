# outputs.tf
# Purpose: Outputs key information about the deployed Service Bus resources.

output "servicebus_namespace_id" {
  description = "The ID of the Service Bus namespace."
  value       = azurerm_servicebus_namespace.sb.id
}

output "servicebus_topic_names" {
  description = "List of created topic names."
  value       = [for t in azurerm_servicebus_topic.sb_topic : t.name]
}

output "servicebus_queue_names" {
  description = "List of created queue names."
  value       = [for q in azurerm_servicebus_queue.sb_queue : q.name]
}

output "servicebus_subscription_names" {
  description = "List of created subscription names."
  value       = [for s in azurerm_servicebus_subscription.sb_subscription : s.name]
}
