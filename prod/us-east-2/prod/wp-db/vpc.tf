data "aws_vpc" "wp-vpc" {
  filter {
    name   = "tag:Name"
    values = ["wp-vpc"]
  }
}

data "aws_subnet" "wp-db-subnets" {
  filter {
    name   = "tag:Purpose"
    values = ["wp-db-subnet-group"]
  }
}

resource "aws_db_subnet_group" "wp-db-subnets" {
  name       = "wp-db-subnets"
  subnet_ids = data.aws_db_subnet_group.wp-db-subnet-group.subnet_ids
  tags = {
    Name = "wp-db-subnet-group"
  }
}
