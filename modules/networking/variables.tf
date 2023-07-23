
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
/*
variable "vpc_id2" {
  description = "ID of the VPC"
  type        = string
}
*/
#variable "public_cidr_block" {
#  description = "CIDR block for the public VPC"
#  type        = string
#}

variable "igw_id"{
  description = "ID of Internet Gateway"
  type        = string
}
variable "public_subnet_cidr_block1" {
  description = "CIDR block for the 1st public subnet"
  type        = string
}

variable "public_subnet_cidr_block2" {
  description = "CIDR block for the 2nd public subnet"
  type        = string
}


variable "public_subnet_availability_zone1" {
  description = "Availability zone for the first public subnet"
  type        = string
}


variable "public_subnet_availability_zone2" {
  description = "Availability zone for the 2nd public subnet"
  type        = string
}


variable "public_subnet_name1" {
    description = "Name of the first public subnet"
    type        = string
}

variable "public_subnet_name2" {
    description = "Name of the second public subnet"
    type        = string
}

variable "public_routing_table_name" {
  description = "Name of the public routing table"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
 # default     = [aws_subnet.public_subnet_id, aws_subnet.public_subnet2_id]
}

/*
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = []
}

variable "public_subnet_id" {
  description = "String of public subnet ID"
  type        = string
  default     = ""
}
*/

/*
variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}
*/


variable "public_subnet_association" {
  description = "public subnet associations with the routing table"
  type        = string
  default     = ""
}



/*
variable private_subnet_ids1{
  description = "List of private subnet IDs"
  type        = list(string)
}
*/
/*
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = [
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id
  ]
}
*/

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
  #default     = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}

variable "private_routing_table_name" {
  description = "Name of the public routing table"
  type        = string
}


variable "private_subnet_association" {
  description = "List of private subnet associations with the private routing table"
  type        = list(string)
  default     = []
}


/*
variable "public_subnet_association" {
  description = "List of public subnets associations with the routing table"
  type        = list(string)
  default     = []
}
*/

#variable "private_subnet_cidr_block" {
#  description = "CIDR block for the private subnet"
#  type        = string
#}

#variable "availability_zone" {
#  description = "Availability zone for the private subnet"
#  type        = string
#}

#variable "private_subnet_name" {
#  description = "Name of the private subnet"
#  type        = string
#}


/*
# private network CIDR blocks defined as "private_cidr_blocks"
variable "private_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]  #private CIDR blocks
}
*/

variable "private_subnet_cidr_block1" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_availability_zone1" {
  description = "Availability zone for the first private subnet"
  type        = string
}

variable "private_subnet_name1" {
  description = "Name of the first private subnet"
  type        = string
}

variable "private_subnet_cidr_block2" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "private_subnet_availability_zone2" {
  description = "Availability zone for the second private subnet"
  type        = string
}

variable "private_subnet_name2" {
  description = "Name of the second private subnet"
  type        = string
}

