# terraform 開発環境インストールメモ

## terraform インストール

```bash
brew install terraform
```

## tflint インストール

```bash
brew install tflint
```

## vscode 拡張機能インストール

- Terraform
- HashiCorp Terraform

## default shell

```bash
chsh -s /bin/BASH
```

## autocomplete 設定

```bash
terraform --install-autocomplete
```

## tfenv インストール

```bash
$ brew unlink terraform
$ brew insatll
$ tfenv list-remote
0.14.3
0.14.2
・・・
$ echo 0.14.3 > .terraform-version
```
