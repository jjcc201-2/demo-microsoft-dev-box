variable "resource_group_name" {
    description = "Name of the resource group to create the virtual network in."
    type        = string
}

variable "location" {
    description = "Azure region where the virtual network will be deployed (eg. 'eastus')."
    type        = string
}

variable "name" {
    description = "Name of the virtual network."
    type        = string
}

variable "subnet_name" {
    description = "Name of the subnet."
    type        = string
}


variable "address_space" {
    description = "List of address space CIDR blocks for the virtual network (eg. [\"10.0.0.0/16\"])."
    type        = list(string)
    default     = ["10.0.0.0/16"]
}


variable "subnet_address_prefixes" {
    description = "List of address space CIDR blocks for the subnet (eg. [\"10.0.2.0/24\"])."
    type        = list(string)
    default     = ["10.0.2.0/24"]
}


variable "tags" {
    description = "A map of tags to assign to the virtual network and related resources."
    type        = map(string)
    default     = {}
}