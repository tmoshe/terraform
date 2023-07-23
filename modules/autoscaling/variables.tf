
variable "elb_instance_id"{
    description = "ID of ELB instance"
    type  = string
  
}

variable "asg_instance_type" {
  description = "Instance type for the Auto Scaling Group instances"
  type        = string
}

variable "asg_subnet_ids" {
  description = "List of subnet IDs where Auto Scaling Group instances will be launched"
  type        = list(string)
}


variable "asg_tags" {
  description = "Tags to apply to the Auto Scaling Group instances"
  type        = map(string)
}


variable "asg_name" {
  description = "Name of the auto scaling group"
  type        = string
}


variable "asg_min_size" {
  description = "Minimum number of instances in the auto scaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the auto scaling group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the auto scaling group"
  type        = number
}


variable "user_data" {
  description = "User data for EC2 instance"
  type        = string
  default     = ""
}

variable "private_security_group_id" {
  description = "security group ID to associate with the Auto Scaling Group instances group of private instance"
  type        = string
  default     = ""

}

