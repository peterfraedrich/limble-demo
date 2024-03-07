
data "aws_security_groups" "wp-net-external-sgs" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id_internal]
  }
  filter {
    name   = "tag:Purpose"
    values = ["allow-https-external"]
  }
}

data "aws_security_groups" "wp-net-internal-sgs" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id_internal]
  }
  filter {
    name   = "tag:Purpose"
    values = ["allow-http-external"]
  }
}

data "aws_subnets" "wp-app-subnets" {
  filter {
    name   = "tag:Purpose"
    values = ["wp-app-subnet"]
  }
}

data "aws_subnets" "wp-external-subnets" {
  filter {
    name   = "tag:Purpose"
    values = ["wp-external"]
  }
}

data "aws_db_proxy" "wp-db-endpoint" {
  name = "wp-db-proxy-${var.environment}"
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = var.rds_password_arn
}
