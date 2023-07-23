/*
variable "public_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
  
}

variable "private_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default = "20.0.0.0/16"
  
}
*/
variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

