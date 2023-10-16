resource "aws_lb_target_group" "target" {
  name        = "target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "instance"
}


resource "aws_lb_target_group_attachment" "target" {
  count            = 1
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.ec2-a.id
  port             = 80
}


resource "aws_lb_target_group_attachment" "target-1" {
  count            = 1
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.ec2-b.id
  port             = 80
}

resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security.id]
  subnets            = [aws_subnet.pub_sub_1.id, aws_subnet.pub_sub_2.id]

  enable_deletion_protection = true

  tags = {
    Environment = terraform.workspace
  }
}





resource "aws_lb_listener" "target" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
