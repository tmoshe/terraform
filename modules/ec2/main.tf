
resource "aws_instance" "public_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.public_security_group_id]
  
  key_name      = var.key_name
  #iam_instance_profile = "S3_Access"
  tags = {
    Name = "Public_ec2_terraform"
  }
    user_data = var.user_data
}

resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids  = [var.private_security_group_id]
  iam_instance_profile = "S3_Access"
  
  key_name      = var.key_name
  tags = {
    Name = "Private_ec2_terraform"
  }
    user_data = var.user_data
}
