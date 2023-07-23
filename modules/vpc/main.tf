# Create a Public VPC
resource "aws_vpc" "vpc_public" {
  
  cidr_block = "172.16.0.0/16"
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  
  tags = {
    Name = "CloudSchool_VPC"
  }
}


resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.vpc_public.id

  tags = {
    Name = "MyInternetGateway"
  }
}



