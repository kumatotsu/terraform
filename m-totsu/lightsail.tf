variable "ls_name" {}

# ドメイン設定
resource "aws_lightsail_domain" "domain" {
  domain_name = "${var.ls_name}.com"
  provider    = aws.useast1
}

# SSHキー作成
# ssh-keygen −t rsa -b 4096
# パスフレーズなし

# SSHアクセスキーの設定
resource "aws_lightsail_key_pair" "key_pair" {
  name       = "key_pair_${var.ls_name}"
  public_key = file("./id_rsa.pub")
}

# 静的PublicIPアドレスの作成
resource "aws_lightsail_static_ip" "static_ip" {
  name = "static_ip_${var.ls_name}"
}

# wordpressサーバー構築
resource "aws_lightsail_instance" "instance" {
  name              = var.ls_name
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "wordpress"
  bundle_id         = "nano_2_0"
  key_pair_name     = aws_lightsail_key_pair.key_pair.name
}

# nano_2_0 : $0.35-1vcpu−0.5GBmemory-20GBEBS-1TBtraffic
# micro_2_0 : $5-1vcpu−1GBmemory-40GBEBS-2TBtraffic
# small_2_0 : $10-1vcpu−2GBmemory-60GBEBS-3TBtraffic
# medium_2_0 : $20-2vcpu−4GBmemory-80GBEBS-4TBtraffic
# large_2_0 : $40-2vcpu−8GBmemory-160GBEBS-5TBtraffic
# xlarge_2_0 : $80-4vcpu−16GBmemory-320GBEBS-6TBtraffic
# 2xlarge_2_0 : $160-8vcpu−32GBmemory-640GBEBS-7TBtraffic

# 静的PublicIPアドレスを設定
resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.static_ip.name
  instance_name  = aws_lightsail_instance.instance.name
  depends_on     = [aws_lightsail_instance.instance]
}

# 静的PublicIPアドレスを出力
output "static_ip" { value = aws_lightsail_static_ip.static_ip.ip_address }

# SSH接続
# ssh -i ./id_rsa bitnami@{static_ipで表示されたIPアドレス}
