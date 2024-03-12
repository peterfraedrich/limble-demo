variable "site_domain" {
  description = "URL of the domain to deploy to"
  type        = string
}

variable "subdomain" {
  description = "subdomain for the site"
  type        = string
}

variable "wp_app_alb_url" {
  description = "DNS name of the ALB"
  type        = string
}

variable "wp_app_alb_id" {
  description = "ID of the app alb"
  type        = string
}
