# Azure Credentials
variable "client_id" {
  type      = string
  default   = ""
  sensitive = true
}
variable "client_secret" {
  type      = string
  default   = ""
  sensitive = true
}

# Azure Subscription
variable "tenant_id" {
  type    = string
  default = ""
}
variable "subscription_id" {
  type    = string
  default = ""
}

# Azure Resource Group
variable "resource_group" {
  type    = string
  default = ""
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
  default   = "wordpress"
  sensitive = true
}

# Proxmox Variables
variable "proxmox_api_url" {
  type    = string
  default = ""
}

variable "proxmox_api_token_id" {
  type    = string
  default = ""
}

variable "proxmox_api_token_secret" {
  type      = string
  default   = ""
  sensitive = true
}

variable "proxmox_node" {
  type    = string
  default = "pve"
}

variable "ssh_username" {
  type    = string
  default = "root"
}