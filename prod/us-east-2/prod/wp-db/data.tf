data "aws_security_group" "vpc-self" {
  vpc_id = data.aws_vpc.wp-vpc.id
  name   = "allow_self"
}

data "aws_db_subnet_group" "wp-db-subnet-group" {
  name = aws_db_instance.wp-db.db_subnet_group_name
}
