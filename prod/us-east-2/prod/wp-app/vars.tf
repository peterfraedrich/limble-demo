variable "wp_image" {
  description = "Version of the Wordpress container to use"
  type        = string
}

variable "environment" {
  type = string
}

variable "rds_password_arn" {
  description = "URN of the password in secrets manager"
  type        = string
}

variable "vpc_id_internal" {
  type = string
}

variable "vpc_app_secgroups" {
  type = list(string)
}

variable "vpc_external_secgroups" {
  type = list(string)
}

variable "db_subnet_group_subnets" {
  type = list(string)
}

variable "external_subnets" {
  type = list(string)
}

variable "internal_subnets" {
  type = list(string)
}
