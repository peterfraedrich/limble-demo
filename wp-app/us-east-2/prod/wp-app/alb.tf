resource "aws_lb" "wp-app-lb" {
  name               = "wp-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups = concat(
    var.vpc_app_secgroups,
    var.vpc_external_secgroups
  )
  subnets = var.external_subnets

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
  target_type = "ip"
  health_check {
    path = "/"
  }
  stickiness {
    enabled         = true
    type            = "lb_cookie"
    cookie_duration = 43200 # 12 hours
  }
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
