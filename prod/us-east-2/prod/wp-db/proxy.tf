

resource "aws_db_proxy" "wp-db-proxy" {
  name                = "wp-db-proxy-${var.environment}"
  debug_logging       = false
  engine_family       = "MYSQL"
  idle_client_timeout = 1800
  require_tls         = true
  vpc_subnet_ids      = data.aws_db_subnet_group.wp-db-subnet-group.subnet_ids
  role_arn            = aws_iam_role.wp-db-access-role.arn

  auth {
    auth_scheme = "SECRETS"
    description = "use DB password from secrets manager"
    iam_auth    = "DISABLED"
    secret_arn  = aws_db_instance.wp-db.master_user_secret.0.secret_arn
  }
}

resource "aws_db_proxy_default_target_group" "wp-db-proxy-tg" {
  db_proxy_name = aws_db_proxy.wp-db-proxy.name
  connection_pool_config {
    connection_borrow_timeout    = 120
    max_connections_percent      = 100
    max_idle_connections_percent = 50
    session_pinning_filters      = ["EXCLUDE_VARIABLE_SETS"]
  }
}

resource "aws_db_proxy_target" "wp-db-proxy-target" {
  db_instance_identifier = aws_db_instance.wp-db.identifier
  db_proxy_name          = aws_db_proxy.wp-db-proxy.name
  target_group_name      = aws_db_proxy_default_target_group.wp-db-proxy-tg.name
}

resource "aws_db_proxy_endpoint" "wp-db-proxy-endpoint" {
  db_proxy_name          = aws_db_proxy.wp-db-proxy.name
  db_proxy_endpoint_name = "wp-db-proxy-endpoint"
  vpc_subnet_ids         = data.aws_db_subnet_group.wp-db-subnet-group.subnet_ids
  target_role            = "READ_WRITE"
}
