variable "environment" {
  description = "prod or non-prod"
  type        = string
}

variable "rds_instance_class" {
  description = "instance class for the RDS server"
  type        = string
}
