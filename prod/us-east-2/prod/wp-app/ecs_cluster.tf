resource "aws_ecs_cluster" "wp-app-cluster" {
  name = "wp-app"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
