/*
output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnets[*].id
}
*/

output private_subnet_id1 {
   description = "The ID of the first private subnets"
   value       =  aws_subnet.private_subnet1.id
}


output private_subnet_id2 {
   description = "The ID of the first private subnets"
   value       =  aws_subnet.private_subnet2.id
}



output public_subnet_id1 {
  description = "ID of the public subnet"
  value        = aws_subnet.public_subnet1.id
}

output public_subnet_id2 {
  description = "ID of 2nd public subnet"
  value        = aws_subnet.public_subnet2.id
}



/*
output "public_vpc_id" {
  description = "ID of the public VPC"
  value       = aws_vpc.public_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}


#output "private_subnet_ids" {
#  description = "The IDs of the private subnets"
#  value       = aws_subnet.private_subnets[*].id
#}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  #value       = aws_subnet.private_subnets.*.id
  value = aws_subnet.private_subnet1
}
*/
/*
output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id
  ]
}
*/

/*
output "nat_gateway_ids" {
  description = "The IDs of the NAT gateways"
  value       = aws_nat_gateway.nat_gateways.*.id
}
*/


#output "nat_gateway_id" {
#  description = "ID of the NAT gateway"
#  value       = aws_nat_gateway.nat_gateway.id
#}

/*
output "private_route_table_id" {
  description = "ID of the private route table"
  value       = aws_route_table.private_route_table.id
}
*/