#!/bin/bash

# 一応
sudo pacman -S  vim

# ファイルが存在しない場合は作成
touch ~/.vimrc

# Vimの設定を追加
echo "set number" >> ~/.vimrc
echo "inoremap <silent> jj <Esc>" >> ~/.vimrc

