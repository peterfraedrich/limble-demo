resource "aws_ecs_service" "wp-app-service" {
  name            = "wp-app"
  cluster         = aws_ecs_cluster.wp-app-cluster.id
  task_definition = aws_ecs_task_definition.wp-app-task.arn
  desired_count   = 3

  launch_type = "FARGATE"

  network_configuration {
    subnets = var.internal_subnets
    security_groups = concat(
      var.vpc_app_secgroups
    )

  }

  load_balancer {
    target_group_arn = aws_lb_target_group.wp-app-tg.arn
    container_name   = "wordpress"
    container_port   = 80
  }
}
