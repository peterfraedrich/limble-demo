output "rds_username" {
  value = var.rds_username
}

output "rds_password_arn" {
  value = aws_db_instance.wp-db.master_user_secret.0.secret_arn
}

output "vpc_id_internal" {
  value = var.vpc_id_internal
}
