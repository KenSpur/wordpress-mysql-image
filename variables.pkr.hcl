# Azure Variables
variable "resource_group" {
  type    = string
  default = ""
}

variable "gallery_name" {
  type    = string
  default = ""
}

variable "image_name" {
  type    = string
  default = "img-wordpress-mysql"
}

variable "image_version" {
  type    = string
  default = "1.0.0"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "replication_regions" {
  type    = list(string)
  default = ["West Europe"]
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