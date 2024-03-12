resource "aws_cloudfront_distribution" "wp-cf" {
  enabled = true

  default_cache_behavior {
    target_origin_id = "wp-app"
    min_ttl          = 0     # no cache
    default_ttl      = 3600  # 1 hour
    max_ttl          = 86400 # 1 day
    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT"
    ]
    cached_methods = [
      "GET",
      "HEAD",
      "OPTIONS"
    ]

    forwarded_values {
      query_string = true
      headers = [
        "Host",
        "Origin",
        "X-Forwarded-Proto"
      ]

      cookies {
        forward = "all"
      }

    }
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method             = "sni-only"
  }

  origin {
    origin_id   = "wp-app"
    domain_name = var.wp_app_alb_url

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"

      origin_ssl_protocols = [
        "SSLv3",
        "TLSv1",
      ]
    }
  }
}
