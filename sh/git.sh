#!/bin/bash


#インストール
sudo pacman -S git lazygit


# 設定の適用
git config --global user.name $USER
git config --global user.email $USER@$USER


# デフォルトのプッシュ設定を設定
git config --global push.default simple


# デフォルトのエディタを設定（vimを使用）
git config --global core.editor vim


# ブランチ名の自動補完を有効化
git config --global core.autocrlf input


#エイリアスを設定
echo "alias lg='lazygit'" >> ~/.bashrc