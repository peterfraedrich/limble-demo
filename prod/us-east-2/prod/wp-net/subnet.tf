resource "aws_subnet" "wp-db-sub-a" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = "10.0.1.0/26"
  availability_zone = "${var.aws_region}a"
  tags = {
    Purpose = "wp-db-subnet-group"
  }
}

resource "aws_subnet" "wp-db-sub-b" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = "10.0.1.64/26"
  availability_zone = "${var.aws_region}b"
  tags = {
    Purpose = "wp-db-subnet-group"
  }
}

resource "aws_subnet" "wp-app-sub-a" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = "10.0.2.0/26"
  availability_zone = "${var.aws_region}a"
  tags = {
    Purpose = "wp-app-subnet"
  }
}

resource "aws_subnet" "wp-app-sub-b" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = "10.0.2.64/26"
  availability_zone = "${var.aws_region}b"
  tags = {
    Purpose = "wp-app-subnet"
  }
}

resource "aws_subnet" "wp-external-sub-a" {
  vpc_id            = aws_vpc.wp-vpc-external.id
  cidr_block        = "10.10.0.0/26"
  availability_zone = "${var.aws_region}a"
  tags = {
    Purpose = "wp-external"
  }
}

resource "aws_subnet" "wp-external-sub-b" {
  vpc_id            = aws_vpc.wp-vpc-external.id
  cidr_block        = "10.10.0.64/26"
  availability_zone = "${var.aws_region}b"
  tags = {
    Purpose = "wp-external"
  }
}
