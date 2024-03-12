resource "aws_subnet" "wp-db-sub-a" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = var.subnet-db-a-cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    Purpose = "wp-db-subnet-group"
  }
}

resource "aws_subnet" "wp-db-sub-b" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = var.subnet-db-b-cidr
  availability_zone = "${var.aws_region}b"
  tags = {
    Purpose = "wp-db-subnet-group"
  }
}

resource "aws_subnet" "wp-app-sub-a" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = var.subnet-app-a-cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    Purpose = "wp-app-subnet"
  }
}

resource "aws_subnet" "wp-app-sub-b" {
  vpc_id            = aws_vpc.wp-vpc.id
  cidr_block        = var.subnet-app-b-cidr
  availability_zone = "${var.aws_region}b"
  tags = {
    Purpose = "wp-app-subnet"
  }
}

resource "aws_subnet" "wp-external-sub-a" {
  vpc_id                  = aws_vpc.wp-vpc.id
  cidr_block              = var.subnet-external-a-cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Purpose = "wp-external"
  }
}

resource "aws_subnet" "wp-external-sub-b" {
  vpc_id                  = aws_vpc.wp-vpc.id
  cidr_block              = var.subnet-external-b-cidr
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true
  tags = {
    Purpose = "wp-external"
  }
}
