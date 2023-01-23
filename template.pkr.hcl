source "azure-arm" "ubuntu-server-22_04-lts" {
  azure_tags = {
    build_by = "packer"
  }

  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"

  location = "${var.location}"

  managed_image_resource_group_name = "${var.resource_group}"
  managed_image_name                = "${var.image_name}"

  vm_size         = "Standard_B1s"
  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts-gen2"
  image_version   = "latest"
}

source "proxmox-clone" "ubuntu-server-22-04-lts" {
  proxmox_url              = "${var.proxmox_api_url}"
  username                 = "${var.proxmox_api_token_id}"
  token                    = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = true

  node     = "${var.proxmox_node}"
  clone_vm = "ubuntu-server-22-04-lts"

  vm_name              = "wordpress-mysql-db"
  template_description = "Wordpress MySQL DB"

  cores  = "1"
  memory = "2048"

  ssh_username = "${var.ssh_username}"

  task_timeout = "5m"
  ssh_timeout  = "30m"
}

build {
  sources = [
    "source.azure-arm.ubuntu-server-22_04-lts",
    "source.proxmox-clone.ubuntu-server-22-04-lts"
  ]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline = [
      "apt-get update",
      "apt-get upgrade -y",
      "apt-get install ansible -y"
    ]
    inline_shebang = "/bin/sh -x"
  }

  provisioner "ansible-local" {
    playbook_file = "./playbooks/provision-mysqldb.yml"
    extra_arguments = [
      "-e", "db_name=${var.db_name}",
      "-e", "db_user=${var.db_user}",
      "-e", "db_password=${var.db_password}"
    ]
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"]
    inline_shebang  = "/bin/sh -x"
    only            = ["azure-arm"]
  }
}