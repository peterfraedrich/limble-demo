resource "aws_default_vpc" "wp-vpc" {
  tags = {
    Name : "default-vpc"
  }
}

