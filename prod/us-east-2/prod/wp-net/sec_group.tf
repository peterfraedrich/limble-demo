resource "aws_security_group" "wp-net-allow-self" {
  name        = "allow_self"
  description = "allow traffic to other resources in the vpc"
  vpc_id      = aws_vpc.wp-vpc.id

  tags = {
    Name = "allow_self"
  }
}

resource "aws_vpc_security_group_ingress_rule" "wp-net-self-ingress" {
  security_group_id            = aws_security_group.wp-net-allow-self.id
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.wp-net-allow-self.id
}

resource "aws_vpc_security_group_egress_rule" "wp-net-self-egress" {
  security_group_id            = aws_security_group.wp-net-allow-self.id
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.wp-net-allow-self.id
}

resource "aws_security_group" "wp-net-allow-external-http" {
  name        = "allow_external_http"
  description = "allow HTTP from external sources"
  vpc_id      = aws_vpc.wp-vpc.id
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

# ALLOW EXTERNAL VPC TO TALK TO ITSELF
resource "aws_security_group" "wp-net-external-allow-self" {
  name        = "external_allow_self"
  description = "allow internal vpc traffic to external vpc"
  vpc_id      = aws_vpc.wp-vpc-external.id

  tags = {
    Name = "external allow self"
  }
}

resource "aws_vpc_security_group_ingress_rule" "wp-net-external-allow-self-ingress" {
  security_group_id            = aws_security_group.wp-net-external-allow-self.id
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.wp-net-external-allow-self.id
}

resource "aws_vpc_security_group_egress_rule" "wp-net-external-allow-self-egress" {
  security_group_id            = aws_security_group.wp-net-external-allow-self.id
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.wp-net-external-allow-self.id
}

# ALLOW HTTP INTO EXTERNAL VPC
resource "aws_security_group" "wp-net-external-allow-http" {
  name        = "allow_external_http"
  description = "allow HTTP from external sources"
  vpc_id      = aws_vpc.wp-vpc-external.id
}

resource "aws_vpc_security_group_ingress_rule" "wp-net-external-http-ingress" {
  security_group_id = aws_security_group.wp-net-external-allow-http.id
  ip_protocol       = "tcp"
  from_port         = "80"
  to_port           = "80"
  cidr_ipv4         = ["0.0.0.0/0"]
}

resource "aws_vpc_security_group_egress_rule" "wp-net-external-http-egress" {
  security_group_id = aws_security_group.wp-net-external-allow-http.id
  ip_protocol       = "tcp"
  from_port         = "80"
  to_port           = "80"
  cidr_ipv4         = ["0.0.0.0/0"]
}
