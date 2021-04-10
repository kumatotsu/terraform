terraform {
  required_version = "0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.22.0"
    }
  }

  # STATファイル置き場のバケット作成コマンド
  # aws s3api create-bucket --bucket m-totsu-terraform --create-bucket-configuration LocationConstraint="ap-northeast-1" --region ap-northea
  # aws s3api put-bucket-versioning --bucket m-totsu-terraform --versioning-configuration Status=Enabled
  # aws s3api put-bucket-encryption --bucket m-totsu-terraform \
  #  --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'

  backend "s3" {
    bucket = "m-totsu-terraform"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "useast1"
}

# メディアファイル（画像・動画）バケット作成コマンド
# aws s3api create-bucket --bucket m-totsu-mediafiles --create-bucket-configuration LocationConstraint="ap-northeast-1" --region ap-northeast-1
# aws s3api put-bucket-versioning --bucket m-totsu-mediafiles --versioning-configuration Status=Suspended
# aws s3api put-bucket-encryption --bucket m-totsu-mediafiles \
#   --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'
