variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "from_port" {
  description = "Starting port for the ingress rule"
  type        = number
}

variable "to_port" {
  description = "Ending port for the ingress rule"
  type        = number
}

variable "protocol" {
  description = "Protocol for the ingress rule"
  type        = string
}

variable "cidr_blocks" {
  description = "CIDR blocks for the ingress rule"
  type        = list(string)
}
