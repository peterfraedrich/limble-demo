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

variable "vpc_id_internal" {}
