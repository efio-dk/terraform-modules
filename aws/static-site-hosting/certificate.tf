# SSL certificate covering primary and secondary domains
resource "aws_acm_certificate" "cert" {
  provider          = aws.useast
  domain_name       = var.domain
  validation_method = "DNS"

  subject_alternative_names = var.fqdn

  tags = {
    Name = var.domain
  }
}

# Domain validation record - primary domain
resource "aws_route53_record" "validation" {
  for_each = { for option in aws_acm_certificate.cert.domain_validation_options : option.resource_record_name => option }

  name    = each.value.resource_record_name
  records = [each.value.resource_record_value]
  ttl     = 60
  type    = each.value.resource_record_type
  zone_id = data.aws_route53_zone.domain.zone_id
}

# Wait for domain validation to complete
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}
