deploy_location       = "canadacentral"
rg_name               = "infra-bastion-rg"
name_vnet             = "infra-vnet-01"
bastion_pip_name      = "infra-bastion-pip1"
bastion_host_name     = "infra-bastion"
ip_configuration_name = "configuration"
prefix_subnet         = "192.168.255.224/27"

default_tags = {
  environment = "Lab"
  designation = "Infrastructure"
  provisioner = "Terraform"
}