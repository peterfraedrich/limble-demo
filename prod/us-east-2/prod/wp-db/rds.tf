resource "aws_db_instance" "wp-db" {
  allocated_storage           = 10
  db_name                     = "wordpress"
  identifier                  = "wp-db-${var.environment}"
  engine                      = "mysql"
  engine_version              = "8.0.36"
  instance_class              = var.rds_instance_class
  username                    = "wordpress"
  manage_master_user_password = true
  parameter_group_name        = "default.mysql8.0"
  skip_final_snapshot         = true
  db_subnet_group_name        = aws_db_subnet_group.wp-db-subnets.name

  tags = {
    Name = "wb-db-${var.environment}"
  }
}

