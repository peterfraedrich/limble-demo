resource "aws_ecs_task_definition" "wp-app-task" {
  family                   = "wp-app"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.wp-app-ecs-role.arn
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  container_definitions = jsonencode([
    {
      name      = "wordpress"
      image     = var.wp_image
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
          value = data.aws_secretsmanager_secret_version.rds_password.secret_string
        },
        {
          name  = "WORDPRESS_DB_NAME"
          value = "wordpress"
        }
      ]
    }
  ])
}
