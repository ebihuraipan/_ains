#!/bin/bash


#依存関係のインストール
sudo pacman -S git fakeroot make gcc binutils --noconfirm


#依存関係のインストール
sudo pacman -S --needed git base-devel


#Yayのインストール
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


#Yayの削除
cd ..
sudo rm -R yay
