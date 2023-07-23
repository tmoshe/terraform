

# Create a public subnet in the public VPC
resource "aws_subnet" "public_subnet1" {
  #vpc_id                  = var.public_vpc.id
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr_block1
  availability_zone = var.public_subnet_availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name1
  }
}


# Create a public subnet2 in the public VPC
resource "aws_subnet" "public_subnet2" {
  #vpc_id                  = var.public_vpc.id
  vpc_id                 = var.vpc_id
  cidr_block             = var.public_subnet_cidr_block2
  availability_zone      = var.public_subnet_availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name2
  }
}



# Creating an Elastic IP for the NAT Gateway!
resource "aws_eip" "nat_eip" {
  vpc = true
  
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id
 
 
  tags = {
    Name = "NAT Gateway"
  }
}
/*
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.private_subnet.id
}
*/

/*
# Creating a Route Table for the Nat Gateway!
resource "aws_route_table" "NAT-Gateway-RT" {
#   depends_on = [
#         aws_nat_gateway.nat_gateway
#   ]
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "Route Table for NAT Gateway"
  }

}
*/


/*
# Create a private subnet in the public VPC
resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
     Name = var.private_subnet_name
  }
}
*/

resource "aws_subnet" "private_subnet1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block1
  availability_zone = var.private_subnet_availability_zone1

  tags = {
    Name = var.private_subnet_name1
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block2
  availability_zone = var.private_subnet_availability_zone2

  tags = {
    Name = var.private_subnet_name2
  }
}

#NEED TO BE CHEKED

resource "aws_route_table" "public_routing_table" {
  vpc_id = var.vpc_id
 # subnet_ids  = var.public_subnet_ids
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
 
  }
  tags = {
    Name = "PublicRoutingTable"
  }
}



/*
resource "aws_route_table" "public_routing_table" {
  vpc_id = var.vpc_id
  
  tags = {
    Name = "PublicRoutingTable"
  }
}
*/

/*
#public_to_nat
resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.public_routing_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
*/
/*
resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_routing_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw.id
}
*/

# Update routing table in the public VPC to route traffic from VPC peering connection to NAT gateway
# routing table in the public VPC to route traffic from VPC peering connection to each private network
/*
resource "aws_route" "public_to_private" {
  for_each                  = toset(var.private_cidr_blocks)
  route_table_id            = aws_route_table.public_routing_table.id
  destination_cidr_block    = each.value
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  #nat_gateway_id            = aws_nat_gateway.nat_gateway.id
  
}
*/

/*
#"private_to_nat"
resource "aws_route" "peering_route" {
  route_table_id            = aws_route_table.private_routing_table.id
  destination_cidr_block    = "0.0.0.0/0"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
*/

/*
resource "aws_route" "public_to_private" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = aws_vpc.private.cidr_block
  nat_gateway_id            = aws_nat_gateway.nat_gateway.id
}
*/

#"private_to_nat"
resource "aws_route_table" "private_routing_table" {
 
 vpc_id = var.vpc_id
  
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
   # vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
    /*
  route {
    cidr_block = "10.0.1.0/24"
    #nat_gateway_id = aws_nat_gateway.nat_gateway.id
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
  */
  tags = {
    Name = "PrivateRoutingTable"
  }
}

/*
resource "aws_route" "private_to_nat" {
  route_table_id         = aws_route_table.private_routing_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
*/

/*
resource "aws_security_group" "public_security_group" {
  name        = "public-security-group"
  vpc_id      = var.vpc_id  # VPC PUblic ID
  tags = {
    Name = "PublicSecurityGroupe"
  }
}
*/

/*
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public_routing_table.id
}
*/
/*
resource "aws_route_table_association" "pubilc_subnet_association" {
  subnet_id      = public_subnet.id
  route_table_id = aws_route_table.public_routing_table.id
}
*/

/*
 #Associate the route table with the public subnet
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_routing_table.id
  
}
*/



resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_routing_table.id
  #route_table_id = aws_nat_gateway.nat_gateway.id
}
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public_routing_table.id
 
}

/*
resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id          = var.vpc_id
  vpc_id               = var.vpc_id2
  auto_accept          = true
}
*/




/*
resource "aws_vpc_peering_connection" "vpc_peering_connection" {
  peer_vpc_id          = var.vpc_id2
  vpc_id               = var.vpc_id
  auto_accept = true

  tags = {
    Name = "VPC Peering Connection"
  }

}

resource "aws_route" "public_to_private" {
  route_table_id            = aws_route_table.public_routing_table.id
  destination_cidr_block   = [var.private_subnet_cidr_block1,var.private_subnet_cidr_block2]
  #destination_cidr_block2   = var.private_subnet_cidr_block2
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
}

resource "aws_route" "private_to_public" {
  route_table_id            = aws_route_table.private_routing_table.id
  destination_cidr_block    = var.public_subnet_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
}
*/
