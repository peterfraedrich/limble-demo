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

resource "aws_route_table" "wp-app-routes-a" {
  vpc_id = aws_vpc.wp-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ext-sub-a-nat.id
  }
}

resource "aws_route_table" "wp-app-routes-b" {
  vpc_id = aws_vpc.wp-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ext-sub-b-nat.id
  }
}

resource "aws_route_table_association" "wp-app-routes-a-assoc" {
  subnet_id      = aws_subnet.wp-app-sub-a.id
  route_table_id = aws_route_table.wp-app-routes-a.id
}

resource "aws_route_table_association" "wp-app-routes-b-assoc" {
  subnet_id      = aws_subnet.wp-app-sub-b.id
  route_table_id = aws_route_table.wp-app-routes-b.id
}

resource "aws_route_table_association" "wp-ext-a" {
  subnet_id      = aws_subnet.wp-external-sub-a.id
  route_table_id = aws_route_table.wp-net-routes.id
}

resource "aws_route_table_association" "wp-ext-b" {
  subnet_id      = aws_subnet.wp-external-sub-b.id
  route_table_id = aws_route_table.wp-net-routes.id
}

resource "aws_eip" "ext-sub-a-eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.wp-net-igw]
}

resource "aws_eip" "ext-sub-b-eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.wp-net-igw]
}

resource "aws_nat_gateway" "ext-sub-a-nat" {
  allocation_id = aws_eip.ext-sub-a-eip.id
  subnet_id     = aws_subnet.wp-external-sub-a.id

  depends_on = [aws_internet_gateway.wp-net-igw]
}

resource "aws_nat_gateway" "ext-sub-b-nat" {
  allocation_id = aws_eip.ext-sub-b-eip.id
  subnet_id     = aws_subnet.wp-external-sub-b.id

  depends_on = [aws_internet_gateway.wp-net-igw]
}
