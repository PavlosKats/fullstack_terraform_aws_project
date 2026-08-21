data "aws_route53_zone" "primary" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "certificate_validation" {
  zone_id         = data.aws_route53_zone.primary.zone_id
  name            = var.certificate_validation_name
  type            = "CNAME"
  ttl             = 300
  records         = [var.certificate_validation_value]
}

resource "aws_route53_record" "api" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.api_record_name}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = "dualstack.${var.alb_dns_name}"
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}