/*
output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2_instance.id
}
*/

output  "ec2_public_instance_id"{
  description = "ID of the created public EC2 instance"
  value       = aws_instance.public_instance.id
}

output  "ec2_private_instance_id"{
  description = "ID of the created private EC2 instance"
  value       = aws_instance.private_instance.id
}
