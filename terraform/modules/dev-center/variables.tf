variable "name" {
  description = "Name for the Dev Center"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "tags" {
    description = "Tags to apply to resources"
    type        = map(string)
    default     = {}
}

variable "github_uri" {
  description = "GitHub URI"
  type        = string
  sensitive   = true
}

variable "github_pat_secret_id" {
  description = "Key Vault secret ID for GitHub PAT"
  type        = string
}

variable "github_path" {
  description = "GitHub path"
  type        = string
}

variable "db_def_name" {
  description = "Name for the Dev Box definition"
  type        = string
}

variable "network_connection_name" {
  description = "Name for the Dev Center network connection"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the created subnet."
  type        = string
}

variable "attached_network_name" {
  description = "Name for the Dev Center attached network"
  type        = string
}

variable "dev_pool_name" {
  description = "Name for the Dev Center project pool"
  type        = string
}

variable "project_id" {
  description = "ID of the Dev Center project"
  type        = string
}