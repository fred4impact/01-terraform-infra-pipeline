variable "instance_type" {
  type        = string
  description = "The type of instance to create"
  default     = "t2.micro"
}
variable "instance_name" {
  type        = string
  description = "The name of the instance to create"
  default     = "Web Server"
}
variable "subnet_id" {
  type        = string
  description = "The subnet ID where the instance will be created"
}
variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs for the instance"
}

variable "key_pair_name" {
  type        = string
  description = "The name of the key pair to use for the instance"
}
