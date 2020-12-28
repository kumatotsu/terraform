# # サブネットマスク定義（パブリック）
# resource "aws_subnet" "public" {
#   vpc_id                  = aws_vpc.example.id
#   cidr_block              = "10.0.0.0/24"
#   map_public_ip_on_launch = true # 自動的にパブリックIPを割り当てる
#   availability_zone       = "ap-northeast-1a"

#   tags = {
#     "Name" = "example-public"
#   }

# }

# # インターネットゲートウェイ
# resource "aws_internet_gateway" "example" {
#   vpc_id = aws_vpc.example.id
# }

# # ルートテーブル定義
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.example.id
# }

# # デフォルトルート設定
# resource "aws_route" "public" {
#   route_table_id         = aws_route_table.public.id
#   gateway_id             = aws_internet_gateway.example.id
#   destination_cidr_block = "0.0.0.0/0"
# }

# # ルートテーブル関連付け
# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }
