variable "name" {
  type        = string
  description = "Name of the security group"
}
variable "description" {
  type        = string
  description = "Description of the security group"
}

variable "vpc_id1"{
  type        = string
  description = "ID of the public VPC"
  
}
/*
variable "vpc_id2"{
  type        = string
  description = "ID of the public VPC"
  
}
*/
/*
variable "name_sg" {
  type        = string
  description = "Name of the security group"
}

variable "description" {
  type        = string
  description = "Description of the security group"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC to associate the security group with"
}

variable "ingress_from_port" {
  type        = number
  description = "Starting port number for ingress traffic"
}

variable "ingress_to_port" {
  type        = number
  description = "Ending port number for ingress traffic"
}


variable "ingress_protocol" {
  description = "The protocol for ingress traffic"
  type        = string
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
# Define other variables for ingress and egress rules

# ...
*/