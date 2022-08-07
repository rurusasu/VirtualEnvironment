#!/bin/bash
# Copyright (c) 2022 astherier
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
#install-firefox.sh
#WSL2のUbuntu側で行うFirefoxのセットアップスクリプト
#最終更新：2022/02/07

# --------------------
# パッケージをインストールする
# --------------------
sudo apt-get -y update && \
sudo apt-get -y upgrade && \
sudo apt-get install -y \
firefox \
fonts-ipafont \
fcitx-mozc \
fonts-noto-cjk \
dbus-x11

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx
fcitx-autostart