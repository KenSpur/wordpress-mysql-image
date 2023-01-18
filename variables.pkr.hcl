# Azure Credentials
variable "client_id" {
  type      = string
  sensitive = true
}
variable "client_secret" {
  type      = string
  sensitive = true
}

# Azure Subscription
variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}

# Azure Resource Group
variable "resource_group" {
  type = string
}
variable "image_name" {
  type    = string
  default = "img-wordpress-mysql"
}
variable "location" {
  type    = string
  default = "westeurope"
}

# Mysql Server
variable "db_name" {
  type    = string
  default = "wordpressdb"
}
variable "db_user" {
  type    = string
  default = "wordpress"
}
variable "db_password" {
  type      = string
  sensitive = true
}