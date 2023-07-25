terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-1"
}


module "security-group" {
  source = "./modules/security-group"
  description = "public_sg"
  name = "public_sg"
  vpc_id1 = module.vpc.public_vpc_id
  #vpc_id2 = module.vpc.private_vpc_id

}

/*
module "s3_module" {
  source = "./modules/s3"  # Path to the module directory
  #version = "2.10.0"
  # Provide any necessary input variables to the module
  bucket_name = "bucketcloudschool"
 
}
*/

module "vpc" {
  source      = "./modules/vpc"
}


module "networking" {
  source = "./modules/networking"
  vpc_id = module.vpc.public_vpc_id
  #vpc_id2 = module.vpc.private_vpc_id

  igw_id = module.vpc.igw_id
  #private_subnet_cidr_block1 = "10.0.1.0/24"
  #private_subnet_cidr_block2 = "10.0.2.0/24"
  #public_subnet_cidr_block = "10.0.3.0/24"

  private_subnet_cidr_block1 = "172.16.1.0/24"
  private_subnet_cidr_block2 = "172.16.2.0/24"
  public_subnet_cidr_block1 = "172.16.3.0/24"
  public_subnet_cidr_block2 = "172.16.4.0/24"
  
  private_subnet_availability_zone1 = "eu-west-1a"
  private_subnet_availability_zone2 = "eu-west-1b"

  #public_subnet_availability_zone = "eu-west-1c" #worked before
  
  public_subnet_availability_zone1 = "eu-west-1a"
  public_subnet_availability_zone2 = "eu-west-1b"
  public_subnet_name1 = "public_subnet_1"
  public_subnet_name2 = "public_subnet_2"
  private_subnet_name1 = "private_subnet_1"
  private_subnet_name2 = "private_subnet_2"
  private_routing_table_name = "PrivateRoutingTable"
  public_routing_table_name = "PublicRoutingTable"
  
  private_subnet_ids = [module.networking.private_subnet_id1, module.networking.private_subnet_id2]
  public_subnet_ids =  [module.networking.public_subnet_id1,  module.networking.public_subnet_id2]
  #public_subnet_ids =  [module.networking.public_subnet_id]
  #public_subnet_ids = [module.networking.public_subnet_id1, module.networking.public_subnet_id2]


  # private_subnet_availability_zone1 = "eu-west-1a"
  # public_subnet_availability_zone1 = "eu-west-1a"
  # private_subnet_availability_zone2 = "eu-west-1b"
  # public_subnet_availability_zone2 = "eu-west-1b"



}



module "my_ec2_instances" {
  source = "./modules/ec2"
  ami_id       = "ami-01dd271720c1ba44f"
  instance_type = "t2.micro"
  instance_name = "Wather_App_terraform"
  public_subnet_id  = module.networking.public_subnet_id1
  private_subnet_id = module.networking.private_subnet_id1
  public_security_group_id  = module.security-group.public_security_group_id
  private_security_group_id =  module.security-group.private_security_group_id
  key_name = "CloudSchool1"
  user_data = file("userdata.sh")

}




module "autoscaling" {
  source = "./modules/autoscaling"
  asg_name               = "asg-app-tf"
  asg_min_size             =  2
  asg_max_size             =  2
  asg_desired_capacity     =  2
  asg_instance_type     = "t2.micro"
  #asg_subnet_ids = [module.networking.private_subnet_id1, module.networking.private_subnet_id2]
  #asg_subnet_ids = [module.networking.public_subnet_id]
  #asg_subnet_ids = [module.networking.private_subnet_id1]
  
  #asg_subnet_ids = [module.networking.private_subnet_id1] #--worked
  #asg_subnet_ids = [module.networking.private_subnet_id1] #--worked
  asg_subnet_ids = [module.networking.private_subnet_id1, module.networking.private_subnet_id2] #--worked
 
  #asg_subnet_ids = [module.networking.private_subnet_id1,  module.networking.private_subnet_id2] 
 
  #asg_security_group_id = module.security-group.private_security_group_id
  #private_instance_security_group_id = [module.security-group.private_security_group_id]
  #private_subnet_id1 = module.networking.private_subnet_id1
  #private_subnets =
  #private_instance_security_group_ids = [module.networking.private_subnet_id1, module.networking.private_subnet_id2]
  private_security_group_id = module.security-group.private_security_group_id
  asg_tags = {
    Name        = "my-asg-instance"
    Environment = "production"
  }
  
  user_data = file("userdata.sh")
  elb_instance_id = module.elb.elb_instance_id
  

}


module "elb" {
  source = "./modules/elb"

  vpc_id             = module.vpc.public_vpc_id
  elb_name            = "elb-tf"
  #public_subnet_id   = [module.networking.public_subnet_id]
  #private_subnet_ids   = [module.networking.private_subnet_id1, module.networking.private_subnet_id2]
 # private_subnet_id1 = module.networking.private_subnet_id1
 # private_subnet_id2 = module.networking.private_subnet_id2
 public_subnet_id1   = module.networking.public_subnet_id1
  public_subnet_id2   = module.networking.public_subnet_id2
  
  elb_security_group_id = module.security-group.security_group_elb_id
 
 # private_subnet_id = module.networking.private_subnet_id1
 # private_subnet_id2 = module.networking.private_subnet_id2

}




