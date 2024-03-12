variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "wp_image" {
  description = "Version of the Wordpress container to use"
  type        = string
}

variable "environment" {
  description = "prod | nonprod"
  type        = string
}

variable "rds_password_arn" {
  description = "URN of the password in secrets manager"
  type        = string
}

variable "vpc_id_internal" {
  description = "VPC ID of the internal vpc"
  type        = string
}

variable "vpc_app_secgroups" {
  description = "list of secgroups for the app containers"
  type        = list(string)
}

variable "vpc_external_secgroups" {
  description = "list of secgroups for the external resources"
  type        = list(string)
}

variable "db_subnet_group_subnets" {
  description = "list of subnet IDs for the database subnet"
  type        = list(string)
}

variable "external_subnets" {
  description = "list of subnet IDs for the external subnets"
  type        = list(string)
}

variable "internal_subnets" {
  description = "list of subnet ID's for the internal subnets"
  type        = list(string)
}

variable "rds_proxy_endpoint" {
  description = "endpoint of the RDS proxy"
  type        = string
}

