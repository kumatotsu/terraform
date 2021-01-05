# サブネットマスク定義（プライベート）
resource "aws_subnet" "private_0" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.65.0/24"
  map_public_ip_on_launch = false # 自動的にパブリックIPを割り当てる
  availability_zone       = "ap-northeast-1a"

  tags = {
    "Name" = "example-private-0"
  }
}
resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.66.0/24"
  map_public_ip_on_launch = false # 自動的にパブリックIPを割り当てる
  availability_zone       = "ap-northeast-1c"

  tags = {
    "Name" = "example-private-1"
  }
}

# ルートテーブル定義
resource "aws_route_table" "private_0" {
  vpc_id = aws_vpc.example.id
}
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.example.id
}

# ルートテーブル関連付け
resource "aws_route_table_association" "private_0" {
  subnet_id      = aws_subnet.private_0.id
  route_table_id = aws_route_table.private_0.id
}
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

# # EIPの定義
# resource "aws_eip" "nat_gateway_0" {
#   vpc        = true
#   depends_on = [aws_internet_gateway.example]
# }
# resource "aws_eip" "nat_gateway_1" {
#   vpc        = true
#   depends_on = [aws_internet_gateway.example]
# }

# # NATGateway
# resource "aws_nat_gateway" "nat_gateway_0" {
#   allocation_id = aws_eip.nat_gateway_0.id
#   subnet_id     = aws_subnet.public_0.id
#   depends_on    = [aws_internet_gateway.example]
# }
# resource "aws_nat_gateway" "nat_gateway_1" {
#   allocation_id = aws_eip.nat_gateway_1.id
#   subnet_id     = aws_subnet.public_1.id
#   depends_on    = [aws_internet_gateway.example]
# }

# # NATGatewayへのルートテーブル定義
# resource "aws_route" "private_0" {
#   route_table_id         = aws_route_table.private_0.id
#   nat_gateway_id         = aws_nat_gateway.nat_gateway_0.id
#   destination_cidr_block = "0.0.0.0/0"
# }
# resource "aws_route" "private_1" {
#   route_table_id         = aws_route_table.private_1.id
#   nat_gateway_id         = aws_nat_gateway.nat_gateway_1.id
#   destination_cidr_block = "0.0.0.0/0"
# }
