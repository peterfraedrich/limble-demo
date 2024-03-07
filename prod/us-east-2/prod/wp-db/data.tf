data "aws_db_subnet_group" "wp-db-subnet-group" {
  name = aws_db_instance.wp-db.db_subnet_group_name
}
