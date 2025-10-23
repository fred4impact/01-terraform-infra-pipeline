#modules/network/variables.tf
variable "vpc_cidr_block" {
  description = "The VPC CIDR block"
  type        = string
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number
  default     = 2
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., prod, staging, dev)"

  validation {
    condition     = contains(["prod", "staging", "dev"], var.environment)
    error_message = "Environment must be one of: prod, staging, dev"
  }
}

variable "resource_name" {
  type        = string
  description = "Resource name following org conventions"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,30}[a-z0-9]$", var.resource_name))
    error_message = "Resource names must be lowercase alphanumeric with hyphens, 4-32 chars, start with a letter, end with letter/number"
  }
}
variable "vpc_name" {
  type        = string
  description = "VPC name"
}
