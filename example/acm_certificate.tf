# # 証明書発行
# resource "aws_acm_certificate" "example" {
#   domain_name               = aws_route53_record.example.name
#   subject_alternative_names = []
#   validation_method         = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # DNSによる証明書の検証 コメントアウトはVer2.0の文法
# resource "aws_route53_record" "example_certificate" {
#   # name    = aws_acm_certificate.example.domain_validation_options[0].resource_record_name
#   # type    = aws_acm_certificate.example.domain_validation_options[0].resource_record_type
#   # records = [aws_acm_certificate.example.domain_validation_options[0].resource_record_value]
#   # zone_id = data.aws_route53_zone.example.id
#   # 参考: https://dev.classmethod.jp/articles/terraform-aws-certificate-validation/
#   for_each = {
#     for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }
#   name    = each.value.name
#   records = [each.value.record]
#   type    = each.value.type
#   zone_id = data.aws_route53_zone.example.id
#   ttl     = 60
# }

# resource "aws_acm_certificate_validation" "example" {
#   certificate_arn = aws_acm_certificate.example.arn
#   # validation_record_fqdns = [aws_route53_record.example_certificate.fqdn]
#   validation_record_fqdns = [for record in aws_route53_record.example_certificate : record.fqdn]
# }

