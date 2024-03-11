variable "environment" {
  description = "prod or non-prod"
  type        = string
}

variable "rds_instance_class" {
  description = "instance class for the RDS server"
  type        = string
}

variable "rds_username" {
  description = "username to use to connect to the database"
  type        = string
}

variable "vpc_id_internal" {
  type = string
}

variable "db_subnets" {
  type = list(string)
}

variable "vpc_app_secgroups" {
  type = list(string)
}

variable "vpc_external_secgroups" {
  type = list(string)
}
