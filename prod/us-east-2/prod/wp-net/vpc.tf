resource "aws_vpc" "wp-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "wp_vpc"
  }
}
