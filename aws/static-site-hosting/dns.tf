resource "aws_route53_record" "this" {
  for_each = toset(var.fqdn)
  zone_id  = data.aws_route53_zone.domain.zone_id
  name     = each.value
  type     = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

data "aws_route53_zone" "domain" {
  name         = var.zone_id == "" ? format("%s.", var.domain) : ""
  zone_id      = var.zone_id # optional
  private_zone = false
}
