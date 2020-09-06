variable "fqdn" {
  description = "List of fully qualified domain names this static site will be accessible at. Eg. [\"blog.efio.dk\", \"engineering.efio.dk\"]"
  type        = list
}

variable "domain" {
  type = string
}

variable "cloudfront_origin_comment" {
  type        = string
  description = "Comment on CloudFront origin access identity"
}

variable "zone_id" {
  description = "optional ID of route53 zone"
  default     = ""
}

variable "bucket" {
  description = "Unique name of bucket, holding the content of your static site"
}

variable "cloudfront_dist_comment" {
  description = "Comment on the CloudFront distribution"
}

variable "environment" {
  description = "Deployment environment"
}

variable "region" {
  description = "region in which resources will be deployed"
}

variable "price_class" {
  default = "PriceClass_100"
}

variable "default_root_object" {
  type    = string
  default = "index.html"
}

variable "custom_error_responses" {
  type = map
  default = {
    404 = "404.html"
  }
}

variable "minimum_cipher_protocol_version" {
  default = "TLSv1.2_2019"
  type    = string
}

variable "iam_policy_path" {
  type        = string
  description = "path of IAM policy"
  default     = "/"
}
