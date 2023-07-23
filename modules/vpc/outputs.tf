/*
output "vpc_id" {
  description = "ID of the VPC"
  #value       = aws_vpc.my_vpc.id
  value       = aws_vpc.vpc_public.id
  
}
*/




output "public_vpc_id" {
  description = "ID of the public VPC"
  value       = aws_vpc.vpc_public.id
}

output "igw_id" {
  description = "The ID of the Internet Gateway created in the AWS environment."
  value       = aws_internet_gateway.my_igw.id
}
/*
output "vpc_name" {
  description = "VPC Name from VPC module"
  value       = var.vpc_name
}
*/







