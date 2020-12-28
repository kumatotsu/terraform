# terraform

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

## 1. 本プロジェクトの目的

terraform学習・理解のためサンプルコードを残す。

## 2. 開発TIPS

### 2.1. 構文チェック

```bash
terraform validate
```

### 2.2. 削除抑止

```HCL
lifecycle {
  prevent_destory = true
}
```

### 2.3. フォーマット

```bash
terraform fmt --recursive --check #dry-run
```

### 2.4. lint 確認

```bash
$ tflint --deep --aws-region=ap-northeast-1

1 issue(s) found:

Error: "ami-0c3fd00af5d33134a76" is invalid AMI ID. (aws_instance_invalid_ami)

  on main.tf line 16:
  16:   ami           = "ami-0c3fd00af5d33134a76"
```

### 2.5. tdstate ファイルS3共有

S3 に保存する。

```HCL
terraform {
  backend "s3" {
    bucket = "totsu-example-test-tfstat"
    key    = "example/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
```
