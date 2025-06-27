#!/bin/bash

# DockerとDocker Composeのインストール
sudo pacman -S docker docker-compose --noconfirm

# Dockerデーモン
sudo systemctl start docker
sudo systemctl enable docker

# dockerグループ
sudo gpasswd -a "$USER" docker


# Docker関連のエイリアスを追加
touch ~/.bashrc
echo "" >> ~/.bashrc
echo "alias d='docker'" >> ~/.bashrc
echo "alias dc='docker-compose'" >> ~/.bashrc


# 確認メッセージ
echo "dockerグループの変更を反映するためには、ログアウトして再ログイン"
