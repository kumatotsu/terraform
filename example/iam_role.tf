# Policy
data "aws_iam_policy_document" "allow_describe_regions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:DescribeRegions"] #リージョン一覧を取得する
    resources = ["*"]
  }
}

# # moduleなしでiam_role

# resource "aws_iam_policy" "example" {
#   name   = "example"
#   policy = data.aws_iam_policy_document.allow_describe_regions.json
# }

# # 信頼関係とRole
# data "aws_iam_policy_document" "ec2_assume_role" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }
# resource "aws_iam_role" "example" {
#   name               = "example"
#   assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
# }

# # RoleにPolicyをAttach
# resource "aws_iam_role_policy_attachment" "example" {
#   role       = aws_iam_role.example.name
#   policy_arn = aws_iam_policy.example.arn
# }

# moduleでiam追加
module "describe_regions_for_ec2" {
  source    = "../modules/iam_role"
  name      = "describe-regions-for-ec2"
  identifer = "ec2.amazonaws.com"
  policy    = data.aws_iam_policy_document.allow_describe_regions.json
}
