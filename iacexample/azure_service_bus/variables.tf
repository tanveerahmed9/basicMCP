# variables.tf
# Purpose: Declares all configurable variables for Azure Service Bus deployment.

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
  default     = "eastus"
}

variable "servicebus_namespace_name" {
  description = "Name of the Service Bus namespace."
  type        = string
}

variable "sku" {
  description = "Service Bus SKU (Standard or Premium)."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "topic_count" {
  description = "Number of topics to create."
  type        = number
  default     = 1
}

variable "topic_name_prefix" {
  description = "Prefix for topic names."
  type        = string
  default     = "project1_topic_"
}

variable "queue_count" {
  description = "Number of queues to create."
  type        = number
  default     = 1
}

variable "queue_name_prefix" {
  description = "Prefix for queue names."
  type        = string
  default     = "project1_queue_"
}

variable "subscription_count" {
  description = "Number of subscriptions to create."
  type        = number
  default     = 1
}

variable "subscription_name_prefix" {
  description = "Prefix for subscription names."
  type        = string
  default     = "project1_sub_"
}
