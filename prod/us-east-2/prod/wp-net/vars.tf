variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet-db-a-cidr" {
  default = "10.0.1.0/26"
}

variable "subnet-db-b-cidr" {
  default = "10.0.1.64/26"
}

variable "subnet-app-a-cidr" {
  default = "10.0.2.0/26"
}

variable "subnet-app-b-cidr" {
  default = "10.0.2.64/26"
}

variable "subnet-external-a-cidr" {
  default = "10.0.10.0/26"
}

variable "subnet-external-b-cidr" {
  default = "10.0.10.64/26"
}
