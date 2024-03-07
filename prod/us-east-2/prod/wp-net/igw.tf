resource "aws_internet_gateway" "wp-net-igw" {
  vpc_id = aws_vpc.wp-vpc.id
}

resource "aws_route_table" "wp-net-routes" {
  vpc_id = aws_vpc.wp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp-net-igw.id
  }
}
