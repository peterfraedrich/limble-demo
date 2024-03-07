resource "aws_default_security_group" "wp-vpc-internal-default" {
  vpc_id = aws_vpc.wp-vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALLOW HTTP FROM EXTERNAL VPC
resource "aws_security_group" "wp-net-allow-external-http" {
  name        = "allow_external_http"
  description = "allow HTTP from external sources"
  vpc_id      = aws_vpc.wp-vpc.id
  tags = {
    name  = "Purpose"
    value = "allow-http-external"
  }
}

resource "aws_vpc_security_group_ingress_rule" "wp-net-allow-external-http-ingress" {
  security_group_id            = aws_security_group.wp-net-allow-external-http.id
  ip_protocol                  = "tcp"
  from_port                    = "80"
  to_port                      = "80"
  referenced_security_group_id = aws_security_group.wp-net-external-allow-http.id
}

resource "aws_vpc_security_group_egress_rule" "wp-net-allow-external-http-egress" {
  security_group_id            = aws_security_group.wp-net-allow-external-http.id
  ip_protocol                  = "tcp"
  from_port                    = "80"
  to_port                      = "80"
  referenced_security_group_id = aws_security_group.wp-net-external-allow-http.id
}

# ALLOW HTTP INTO EXTERNAL VPC
resource "aws_security_group" "wp-net-external-allow-http" {
  name        = "allow_public_http"
  description = "allow HTTP from external sources"
  vpc_id      = aws_vpc.wp-vpc.id
  tags = {
    name  = "Purpose"
    value = "allow-https-external"
  }
}

resource "aws_vpc_security_group_ingress_rule" "wp-net-external-http-ingress" {
  security_group_id = aws_security_group.wp-net-external-allow-http.id
  ip_protocol       = "tcp"
  from_port         = "80"
  to_port           = "80"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "wp-net-external-http-egress" {
  security_group_id = aws_security_group.wp-net-external-allow-http.id
  ip_protocol       = "tcp"
  from_port         = "80"
  to_port           = "80"
  cidr_ipv4         = "0.0.0.0/0"
}
