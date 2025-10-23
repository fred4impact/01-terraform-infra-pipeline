# modules/base/metadata/variables.tf
variable "environment" {
  type        = string
  description = "Environment name (e.g., prod, staging, dev)"
  validation {
    condition     = contains(["prod", "staging", "dev"], var.environment)
    error_message = "Environment must be one of: prod, staging, dev"
  }
}

variable "region_short" {
  type        = string
  description = "Short region name (e.g., use1 for us-east-1)"
  validation {
    condition     = can(regex("^[a-z]{3}[1-2]$", var.region_short))
    error_message = "Region short name must be in format: use1, usw2, etc"
  }
}

variable "application" {
  type        = string
  description = "Application name"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.application))
    error_message = "Application name must contain only lowercase letters, numbers, and hyphens"
  }
}

variable "component" {
  type        = string
  description = "Component name (e.g., web, api, db)"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.component))
    error_message = "Component name must contain only lowercase letters, numbers, and hyphens"
  }
}
