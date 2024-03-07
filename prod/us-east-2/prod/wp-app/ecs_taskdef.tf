
resource "aws_ecs_task_definition" "wp-app-task" {
  family = "wp-app"
  container_definitions = jsonencode([
    {
      name      = "wordpress"
      image     = var.wp_image
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      environment = [
        {
          name  = "WORDPRESS_DB_HOST"
          value = data.aws_db_proxy.wp-db-endpoint.endpoint
        },
        {
          name  = "WORDPRESS_DB_USER"
          value = "wordpress"
        },
        {
          name  = "WORDPRESS_DB_PASSWORD"
          value = data.aws_db_proxy.wp-db-endpoint.endpoint
        }
      ]
    }
  ])
}
