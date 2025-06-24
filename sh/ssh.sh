#!/bin/bash
source .env 


# SSHのインストール
sudo pacman -S openssh --noconfirm

# SSHサーバーの設定ファイルをバックアップ
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak


# SSHサーバーの起動と自動起動設定
sudo systemctl start sshd
sudo systemctl enable sshd


# SSHディレクトリの作成とパーミッション設定
mkdir -p ~/.ssh
chmod 700 ~/.ssh


# SSHキーの生成
read -p "SSHキーのパスフレーズを入力してください（空にするとパスフレーズなし）: " passphrase
ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f ~/.ssh/id_${USER_NAME}_ed25519 -N "$passphrase"

# 公開鍵ファイルのパーミッション設定
# chmod 600 ~/.ssh/id_ed25519
# chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_${USER_NAME}_ed25519
chmod 644 ~/.ssh/id_${USER_NAME}_ed25519.pub


# authorized_keysファイル(公開鍵置き場)の作成と設定
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys


# パブリックキーの追加
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys


