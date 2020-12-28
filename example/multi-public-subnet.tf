# サブネットマスク定義（パブリック）
resource "aws_subnet" "public_0" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true # 自動的にパブリックIPを割り当てる
  availability_zone       = "ap-northeast-1a"

  tags = {
    "Name" = "example-public-0"
  }

}
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true # 自動的にパブリックIPを割り当てる
  availability_zone       = "ap-northeast-1c"

  tags = {
    "Name" = "example-public-1"
  }

}

# インターネットゲートウェイ
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

# ルートテーブル定義
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}

# デフォルトルート設定
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.example.id
  destination_cidr_block = "0.0.0.0/0"
}

# ルートテーブル関連付け
resource "aws_route_table_association" "public_0" {
  subnet_id      = aws_subnet.public_0.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}
