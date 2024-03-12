variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet-db-a-cidr" {
  description = "CIDR range for the RDS subnet A"
  default     = "10.0.1.0/26"
}

variable "subnet-db-b-cidr" {
  description = "CIDR range for the RDS subnet B"
  default     = "10.0.1.64/26"
}

variable "subnet-app-a-cidr" {
  description = "CIDR range for the App subnet A"
  default     = "10.0.2.0/26"
}

variable "subnet-app-b-cidr" {
  description = "CIDR range for the App subnet B"
  default     = "10.0.2.64/26"
}

variable "subnet-external-a-cidr" {
  description = "CIDR range for subnets for external services"
  default     = "10.0.10.0/26"
}

variable "subnet-external-b-cidr" {
  description = "CIDR range for subnets for external services"
  default     = "10.0.10.64/26"
}
