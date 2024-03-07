resource "aws_lb" "wp-app-lb" {
  name               = "wp-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [for sg in data.aws_security_groups.wp-net-external-sgs : sg.id]
  subnets            = [for subnet in data.aws_subnets.wp-external-subnets : subnet.id]

  tags = {
    Name    = "wp-app-lb"
    Purpose = "external-https"
  }
}

resource "aws_lb_target_group" "wp-app-tg" {
  name        = "wp-app-tg"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id_internal
  target_type = "alb"
}

resource "aws_lb_target_group_attachment" "wp-app-tg-attach" {
  target_group_arn = aws_lb_target_group.wp-app-tg.arn
  target_id        = aws_ecs_service.wp-app-service.id
  port             = 80
}

resource "aws_lb_listener" "wp-app-lb-listener" {
  load_balancer_arn = aws_lb.wp-app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wp-app-tg.arn
  }
}
