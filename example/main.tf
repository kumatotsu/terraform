terraform {
  required_version = "0.14.3"
  required_providers {
    mycloud = {
      source  = "hashicorp/aws"
      version = "3.22.0"
    }
  }
  backend "s3" {
    bucket = "totsu-example-test-tfstat"
    key    = "example/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "mycloud" {
  region = "ap-northeast-1"
}
