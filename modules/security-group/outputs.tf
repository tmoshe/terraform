output public_security_group_id {
  description = "ID of the public security group"
  value        = aws_security_group.public_sg.id 
 
}

output private_security_group_id {
  description = "ID of the private security group"
  value        = aws_security_group.private_sg.id
  
}

/*
output security_elb_sg_id {
  description = "ID of the security group"
  value        = aws_security_group.elb_sg.id
  
}
*/
output "security_group_elb_id" {
  description = "ID of the security group"
  value = aws_security_group.elb_sg.id  
}