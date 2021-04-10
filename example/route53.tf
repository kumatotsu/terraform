##
## import command
##
# terraform import aws_route53_zone.tostu_example_work Z06123842VC1QGXSX4N14
# aws_route53_zone.tostu_example_work: Importing from ID "Z06123842VC1QGXSX4N14"...
# aws_route53_zone.tostu_example_work: Import prepared!
#   Prepared aws_route53_zone for import
# aws_route53_zone.tostu_example_work: Refreshing state... [id=Z06123842VC1QGXSX4N14]

# Import successful!

# The resources that were imported are shown above. These resources are now in
# your Terraform state and will henceforth be managed by Terraform.

# data "aws_route53_zone" "example" {
#   name = "tostu-example.work"
# }

# resource "aws_route53_zone" "tostu_example_work" {
#   comment = "テストドメイン"
#   name    = data.aws_route53_zone.example.name
# }

# resource "aws_route53_record" "example" {
#   zone_id = data.aws_route53_zone.example.zone_id
#   name    = "www.${data.aws_route53_zone.example.name}"
#   type    = "A"

#   alias {
#     name                   = aws_lb.example.dns_name
#     zone_id                = aws_lb.example.zone_id
#     evaluate_target_health = true
#   }
# }

# output "domain_name" {
#   value = aws_route53_record.example.name
# }


