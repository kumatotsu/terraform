resource "aws_instance" "example-1" {
  ami           = "ami-0c3fd0f5d33134a76"
  instance_type = "t3.micro"

  tags = {
    "Name" = "example-1"
  }

  user_data = <<EOF
    #!bin/bash
    yum install -y httpd
    systemctl restart httpd.service
  EOF
}
