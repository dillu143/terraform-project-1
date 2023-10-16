resource "aws_launch_configuration" "temp" {
  image_id               = "ami-0bb4c991fa89d4b9b"
  instance_type          = "t2.micro"
  security_groups        = ["${aws_security_group.security.id}"]
  key_name               = "key-pair"
  user_data = file("usdata-1.sh")
    lifecycle {
    create_before_destroy = true
  }
}
## Creating AutoScaling Group
resource "aws_autoscaling_group" "auto-a" {
  launch_configuration = "${aws_launch_configuration.temp.id}"
availability_zones = ["${"data.aws_availability_zones.1a.names"}"]
  min_size = 1
  max_size = 4
  load_balancers = ["${aws_lb.alb.id}"]
  health_check_type = "ALB"
  tag {
    key = "auto"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}
