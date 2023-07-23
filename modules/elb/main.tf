resource "aws_elb" "app_elb" {
    name  = var.elb_name
    security_groups = [var.elb_security_group_id]
    subnets   = [var.public_subnet_id1, var.public_subnet_id2]
  
   
    cross_zone_load_balancing   =   true
    health_check{
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        interval = 30
        target = "HTTP:5000/"
    }
    listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = 5000
        instance_protocol = "http"
    }
     listener {
        lb_port = 8080
        lb_protocol = "http"
        instance_port = 5000
        instance_protocol = "http"
    }
}
