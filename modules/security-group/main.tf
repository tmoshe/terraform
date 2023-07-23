
resource "aws_security_group" "public_sg" {
  name        = "public-security-group"
  description = "Security group for public EC2 instances"
  vpc_id      = var.vpc_id1


  # Ingress rules
  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#   ingress {
#     from_port         = 0
#     to_port           = 0
#     protocol          = "-1"  # All protocols
#     cidr_blocks = ["20.0.0.0/16"]
#   }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "private_sg" {
  name        = "private-security-group"
  description = "Security group for private EC2 instances"
  vpc_id      = var.vpc_id1


  # Ingress rules
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow ssh connection from public to private machines"
    cidr_blocks = ["172.16.3.0/24"]
  }

  ingress { //for test
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    description = "public to app"
    security_groups = ["${aws_security_group.public_sg.id}"]
  }

    
   ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    description = "Allow connection from ELB to private machines"
    security_groups =  ["${aws_security_group.elb_sg.id}"]
  }

  
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    description = "ICMP inbound rule"
    cidr_blocks = ["172.16.3.0/24"]
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "elb_sg" {
  name        = "ELB Security Group"
  description = "Load Balancer Security Group"
  vpc_id      = var.vpc_id1
  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  # HTTPS access from anywhere
 ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
/*
   ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  */ 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}












/*
resource "aws_security_group" "public_sg" {
  name        = "public-security-group"
  vpc_id      = var.vpc_id1  # VPC Public ID
  tags = {
    Name = "PublicSecurityGroup"
  }
}
resource "aws_security_group_rule" "ingress_rule_1" {
  security_group_id = aws_security_group.public_sg.id
  type              = "ingress"
  from_port         = var.ingress_from_port
  to_port           = var.ingress_to_port
  protocol          = var.ingress_protocol
  cidr_blocks       = var.ingress_cidr_blocks
}

resource "aws_security_group_rule" "ingress_rule_2" {
  security_group_id = aws_security_group.public_sg.id
  type              = "ingress"
  from_port         = var.ingress_from_port
  to_port           = var.ingress_to_port
  protocol          = var.ingress_protocol
  cidr_blocks       = var.ingress_cidr_blocks
}

resource "aws_security_group_rule" "example_egress_rule" {
  security_group_id = aws_security_group.example.id
  type              = "egress"
  from_port         = var.egress_from_port
  to_port           = var.egress_to_port
  protocol          = var.egress_protocol
  cidr_blocks       = var.egress_cidr_blocks
}
*/