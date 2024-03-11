resource "aws_ecs_cluster" "wp-app-cluster" {
  name = "wp-app"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "wp-app-fargate" {
  cluster_name       = aws_ecs_cluster.wp-app-cluster.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}
