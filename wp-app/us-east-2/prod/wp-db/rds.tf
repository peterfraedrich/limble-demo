resource "aws_db_instance" "wp-db" {
  allocated_storage           = 10
  db_name                     = "wordpress"
  identifier                  = "wp-db-${var.environment}"
  engine                      = "mysql"
  engine_version              = "8.0.36"
  instance_class              = var.rds_instance_class
  username                    = var.rds_username
  manage_master_user_password = true
  parameter_group_name        = "default.mysql8.0"
  skip_final_snapshot         = true
  db_subnet_group_name        = aws_db_subnet_group.wp-db-subnets.name

  # backups
  backup_retention_period = 3
  backup_target           = "region"
  backup_window           = "03:00-06:00"

  tags = {
    Name = "wb-db-${var.environment}"
  }
}

