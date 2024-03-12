output "wp_app_alb_url" {
  value = aws_lb.wp-app-lb.dns_name
}

output "wp_app_alb_id" {
  value = aws_lb.wp-app-lb.id
}
