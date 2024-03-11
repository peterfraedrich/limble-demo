output "vpc_id_internal" {
  value = aws_vpc.wp-vpc.id
}

output "db_subnet_group_subnets" {
  value = [
    aws_subnet.wp-db-sub-a.id,
    aws_subnet.wp-db-sub-b.id
  ]
}

output "external_subnets" {
  value = [
    aws_subnet.wp-external-sub-a.id,
    aws_subnet.wp-external-sub-b.id
  ]
}

output "internal_subnets" {
  value = [
    aws_subnet.wp-app-sub-a.id,
    aws_subnet.wp-app-sub-b.id
  ]
}

output "vpc_app_secgroups" {
  value = [
    aws_security_group.wp-net-allow-external-http.id
  ]
}

output "vpc_external_secgroups" {
  value = [
    aws_security_group.wp-net-external-allow-http.id
  ]
}
