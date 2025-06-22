#!/bin/bash


#インストール
sudo pacman -S fcitx5-im fcitx5-mozc


# fcitx5を環境変数に追加
echo '
GTK_IM_MODULE="fcitx5
QT_IM_MODULE="fcitx5
XMODIFIERS=@im="fcitx5"
' | sudo tee -a /etc/environment > /dev/null


# fcitx5を起動するように設定
echo '
fcitx5 &
' >> ~/.xinitrc


echo "==要再起動、または再ログイン=="
