# this throws an error on `plan` if the DB hasnt been built yet; this is normal
data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = var.rds_password_arn
}

data "aws_iam_policy" "task_exe_policy" {
  name = "AmazonECSTaskExecutionRolePolicy"
}
