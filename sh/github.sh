#!/bin/bash
source ../.env


# ディレクトリの存在チェック関数
if [ ! -d "~/.ssh/config" ]; then
    echo "エラー: ~/.ssh/config が見つかりません"
    exit 1
fi


# SSHの設定ファイルを編集
echo "" >> ~/.ssh/config
echo "" >> ~/.ssh/config
echo "Host github.com" >> ~/.ssh/config
echo "IdentityFile ~/.ssh/${GITHUB_KEY}" >> ~/.ssh/config
echo "User git" >> ~/.ssh/config




