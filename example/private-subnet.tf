# サブネットマスク定義（プライベート）
# resource "aws_subnet" "private" {
#   vpc_id                  = aws_vpc.example.id
#   cidr_block              = "10.0.64.0/24"
#   map_public_ip_on_launch = false # 自動的にパブリックIPを割り当てる
#   availability_zone       = "ap-northeast-1a"

#   tags = {
#     "Name" = "example-private"
#   }
# }

# # ルートテーブル定義
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.example.id
# }

# # ルートテーブル関連付け
# resource "aws_route_table_association" "private" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.private.id
# }

# # EIPの定義
# resource "aws_eip" "nat_gateway" {
#   vpc        = true
#   depends_on = [aws_internet_gateway.example]
# }

# # NATGateway
# resource "aws_nat_gateway" "example" {
#   allocation_id = aws_eip.nat_gateway.id
#   subnet_id     = aws_subnet.private.id
#   depends_on    = [aws_internet_gateway.example]
# }

# # NATGatewayへのルートテーブル定義
# resource "aws_route" "private" {
#   route_table_id         = aws_route_table.private.id
#   nat_gateway_id         = aws_nat_gateway.example.id
#   destination_cidr_block = "0.0.0.0/0"
# }
