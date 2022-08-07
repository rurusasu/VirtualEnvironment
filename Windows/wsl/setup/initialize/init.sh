#!/bin/bash
# Copyright (c) 2022 astherier
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
#init.sh
#WSL2のUbuntu側で行う初期設定のセットアップスクリプト
#最終更新：2022/04/14

cd /etc
sudo touch ./wsl.conf && \
cat << 'EOS' >> ~/.wsl.conf

[network]
generateResolvConf = false

EOS

# aptミラー・サイトの設定、aptパッケージの更新
sudo sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

sudo apt update
sudo apt upgrade