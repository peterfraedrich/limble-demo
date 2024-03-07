data "aws_security_group" "default" {
  vpc_id = aws_default_vpc.wp-vpc.id
  name   = "default"
}

data "aws_subnets" "wp-app-subnets" {
  filter {
    name   = "tag:Purpose"
    values = ["wp-app-subnet"]
  }
}

data "aws_db_proxy" "wp-db-endpoint" {
  name = "wp-db-proxy-${var.environment}"
}
