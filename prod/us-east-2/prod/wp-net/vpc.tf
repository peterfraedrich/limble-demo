resource "aws_vpc" "wp-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "wp_vpc"
  }
}
