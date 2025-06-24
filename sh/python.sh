#!/bin/bash


# Pythonのインストール
sudo pacman -S python python-pip --noconfirm


# Pythonのバージョン確認
echo "Pythonのバージョン:"
python3 --version


# pipのバージョン確認
echo "pipのバージョン:"
pip3 --version


# pipのアップグレード
pip3 install --upgrade pip

