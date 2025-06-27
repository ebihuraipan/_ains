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

mkdir ~/venv/
python3 -m venv ~/venv/


# venvの起動
source ~/venv/bin/activate


#venv追記
echo "source ~/venv/bin/activate" >> ~/.bashrc


# 仮想環境用意
mkdir ~/venv
python3 -m venv ~/venv
source ~/venv/bin/activate
echo "source ~/venv/bin/activate" >> ~/.bashrc