#!/bin/bash
source .env


# AWS CLIのインストール
sudo pacman -S aws-cli expect --noconfirm


# Pythonパッケージの依存関係をインストール
sudo pacman -S python-botocore python-jmespath python-docutils --noconfirm


# AWS CLIの初期設定（expectで自動化）
expect << 'END'
spawn aws configure
expect "AWS Access Key ID"
send "$AWS_ACCESS_KEY_ID\r"
expect "AWS Secret Access Key"
send "$AWS_SECRET_ACCESS_KEY\r"
expect "Default region name"
send "$AWS_DEFAULT_REGION\r"
expect "Default output format"
send "$AWS_DEFAULT_OUTPUT\r"
expect eof
END


# 設定ファイルの確認
# 設定ファイルは以下の場所に保存されます
# ~/.aws/config
# ~/.aws/credentials


# 設定の確認
aws configure list


# バージョンの確認
aws --version


# セッションの作成（必要に応じて）
# aws sts get-session-token --duration-seconds 3600
