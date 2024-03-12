resource "aws_db_subnet_group" "wp-db-subnets" {
  name       = "wp-db-subnets"
  subnet_ids = var.db_subnets
  tags = {
    Name = "wp-db-subnet-group"
  }
}
