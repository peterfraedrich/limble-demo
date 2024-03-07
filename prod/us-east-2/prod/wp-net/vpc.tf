resource "aws_vpc" "wp-vpc" {
  cidr_block = "10.0.0.0/8"

  tags = {
    Name = "wp-vpc"
  }
}

resource "aws_vpc" "wp-vpc-external" {
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "wp_vpc_external"
  }
}
