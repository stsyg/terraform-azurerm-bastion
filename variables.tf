variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources will be created"
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group"
}

variable "name_vnet" {
  type        = string
  description = "Name of the vNet"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to add to deployed resources"
}

variable "prefix_subnet" {
  type        = string
  description = "Azure Bastion Subnet prefix"
}

variable "bastion_pip_name" {
  type        = string
  description = "Azure Bastion Public IP name"
}

variable "bastion_host_name" {
  type        = string
  description = "Azure Bastion Host name"
}
variable "rg_vnet" {
  type        = string
  description = "Resource Group of Infrastructure vNet"
}

variable "ip_configuration_name" {
  type        = string
  description = "Azure Bastion IP configuration name"
}