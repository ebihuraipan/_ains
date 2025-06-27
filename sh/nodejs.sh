#!/bin/bash


# Node.jsとnpmのインストール
sudo pacman -S nodejs npm --noconfirm


# Node.jsのバージョン管理ツールnのインストール
sudo npm install -g n
sudo n stable
sudo n latest
n list


# yarnのインストール
npm install -g yarn


# pnpmのインストール
npm install -g pnpm


# 環境変数の更新
echo "=== 環境変数を更新します ==="
source ~/.bashrc

# 確認メッセージ
echo "Node.js: $(node --version)"
echo "npm: $(npm --version)"
echo "yarn: $(yarn --version)"
echo "pnpm: $(pnpm --version)"
echo "設定を反映するには、新しいターミナルを開いてください。"
