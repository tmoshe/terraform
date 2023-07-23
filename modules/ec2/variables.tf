
variable "ami_id" {
  description = "AMI ID for tfor both instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for both instances"
  type        = string
}

variable "instance_name" {
  description = "Instance name for both instances"
  type        = string
}
variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_security_group_id" {
  description = "ID of the public security group"
  type        = string
 # default     = [""]
}

variable "private_security_group_id" {
 description = "ID of the private security group"
 type        = string
}

variable "key_name" {
  description = "Name of the key pair to associate with EC2 instances"
  type        = string
}

variable "user_data" {
  description = "User data for EC2 instance"
  type        = string
  default     = ""
}
