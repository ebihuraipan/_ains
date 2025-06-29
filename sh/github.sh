#!/bin/bash
source ../.env


# SSH設定ファイルの存在チェック
if [ ! -f "$HOME/.ssh/config" ]; then
    echo "エラー: SSH設定ファイルが見つかりません。"
    exit 1
fi


# gitのチェック
if ! command -v "git" &> /dev/null; then
    echo "エラー: git コマンドが見つかりません"
    exit 1
fi


# 鍵のコピー
cat ../sec/github.key > ~/.ssh/${GITHUB_KEY}
chmod 600 ~/.ssh/${GITHUB_KEY}


# SSHの設定ファイルを編集
echo "" >> ~/.ssh/config
echo "" >> ~/.ssh/config
echo "Host github.com" >> ~/.ssh/config
echo "IdentityFile ~/.ssh/${GITHUB_KEY}" >> ~/.ssh/config
echo "User git" >> ~/.ssh/config


#テスト用
echo "テスト用: git clone git@github.com:ebihuraipan/_ains.git"


