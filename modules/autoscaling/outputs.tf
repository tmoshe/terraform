output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.autoscaling_group.name
}


output "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group"
  value       = aws_autoscaling_group.autoscaling_group.min_size
  
}

output "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group"
  value       = aws_autoscaling_group.autoscaling_group.max_size
}