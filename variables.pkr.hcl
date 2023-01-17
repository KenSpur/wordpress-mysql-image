# Azure Credentials
variable "client_id" {
    type = string
    sensitive = true
}
variable "client_secret" {
    type = string
    sensitive = true
}
variable "tenant_id" {
    type = string
    sensitive = true
}
variable "subscription_id" {
    type = string
    sensitive = true
}

# Azure Resource Group
variable "resource_group" {
    type = string
}
variable "image_name" {
    type = string
}
variable "location" {
    type = string
    default = "westeurope"
}