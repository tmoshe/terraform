variable "elb_name" {
  description = "The name of the ELB."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the ELB will be deployed."
  type        = string
}



variable "public_subnet_id1" {
  description = "Public subnet id1"
  type = string
}
variable "public_subnet_id2" {
  description = "Public subnet id2"
  type = string
}


variable "elb_security_group_id" {
  description = "ID of the security group to associate with the ELB"
  type        = string
}
