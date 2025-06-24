#!/bin/bash

# 仮想での共有
# ゲスト側で実行

sudo pacman -S spice-vdagent
sudo systemctl enable spice-vdagent
sudo systemctl start spice-vdagent
