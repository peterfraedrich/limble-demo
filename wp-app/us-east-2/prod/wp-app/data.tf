
data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = var.rds_password_arn
}

data "aws_iam_policy" "task_exe_policy" {
  name = "AmazonECSTaskExecutionRolePolicy"
}
