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
  description = "ID of the internal VPC"
  type        = string
}

variable "db_subnets" {
  description = "list of IDs for the DB subnets"
  type        = list(string)
}

variable "vpc_app_secgroups" {
  description = "list of IDs for the application sec groups"
  type        = list(string)
}

variable "vpc_external_secgroups" {
  description = "list of IDs for the external sec groups"
  type        = list(string)
}
