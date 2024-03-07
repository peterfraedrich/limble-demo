output "internal_vpc" {
  value = aws_vpc.wp-vpc.id
}

output "db_subnet_group_subnets" {
  value = [
    aws_subnet.wp-db-sub-a.id,
    aws_subnet.wp-db-sub-b.id
  ]
}
