resource "aws_ecs_task_definition" "wp-app-task" {
  family                   = "wp-app"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.wp-app-ecs-role.arn
  execution_role_arn       = aws_iam_role.wp-app-ecs-role.arn
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
          value = var.rds_proxy_endpoint
        },
        {
          name  = "WORDPRESS_DB_USER"
          value = "wordpress"
        },
        {
          name  = "WORDPRESS_DB_PASSWORD"
          value = jsondecode(data.aws_secretsmanager_secret_version.rds_password.secret_string).password
        },
        {
          name  = "WORDPRESS_DB_NAME"
          value = "wordpress"
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-create-group  = "true"
          awslogs-region        = "${var.aws_region}"
          awslogs-group         = "wordpress"
          awslogs-stream-prefix = "wp-app"
        }
      },
      mountPoints = [
        {
          sourceVolume  = "wp-app-efs",
          containerPath = "/var/www/html/wp-content",
          readOnly      = false
        }
      ]
    }
  ])
  volume {
    name = "wp-app-efs"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.wp-app-efs.id
    }
  }
}
