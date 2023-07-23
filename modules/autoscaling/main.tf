resource "aws_launch_configuration" "autoscale_config" {
 
  name_prefix   = var.asg_name
  image_id      = "ami-01dd271720c1ba44f"
  instance_type = var.asg_instance_type
  
  iam_instance_profile = "arn:aws:iam::150170288257:instance-profile/S3_Access"
  
  security_groups = [var.private_security_group_id]
  key_name        = "CloudSchool1"
  user_data = var.user_data
}

resource "aws_autoscaling_group" "autoscaling_group" {
 
  name                 = var.asg_name
  launch_configuration = aws_launch_configuration.autoscale_config.name
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  vpc_zone_identifier  = var.asg_subnet_ids
  desired_capacity     = var.asg_desired_capacity
  load_balancers =    [var.elb_instance_id]
  health_check_type = "ELB"
 
  tag {
    key = "Name"
    value = "asg_tf"
    propagate_at_launch = true
  }

  
}