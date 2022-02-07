#!/bin/bash
# Copyright (c) 2022 astherier
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
#install-firefox.sh
#WSL2のUbuntu側で行うFirefoxのセットアップスクリプト
#最終更新：2022/02/07

#インストールするパッケージ名(PACKAGE_NAME)を指定してください。
export PACKAGE_NAME_1=firefox
export PACKAGE_NAME_2=fonts-ipafont
export PACKAGE_NAME_3=fcitx-mozc
export PACKAGE_NAME_4=fonts-noto-cjk
export PACKAGE_NAME_5=dbus-x11

# --------------------
# パッケージをインストールする
# --------------------
${PACKAGE_NAME} -v &> /dev/null # Nodejsがインストール済みか判定
if [ $? -ne 0 ]; then
    echo "未インストールの場合"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y ${PACKAGE_NAME}
else
    echo "${PACKAGE_NAME}: インストール済み"
fi

# --------------------
# フォントをインストールする
# --------------------
${PACKAGE_NAME_2} -v &> /dev/null # Nodejsがインストール済みか判定
if [ $? -ne 0 ]; then
    echo "未インストールの場合"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y ${PACKAGE_NAME_2}
else
    echo "${PACKAGE_NAME_2}: インストール済み"
fi

# --------------------
# 日本語入力設定を行う
# --------------------
${PACKAGE_NAME_3} -v &> /dev/null # Nodejsがインストール済みか判定
if [ $? -ne 0 ]; then
    echo "未インストールの場合"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y ${PACKAGE_NAME_3}
else
    echo "${PACKAGE_NAME_3}: インストール済み"
fi

${PACKAGE_NAME_4} -v &> /dev/null # Nodejsがインストール済みか判定
if [ $? -ne 0 ]; then
    echo "未インストールの場合"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y ${PACKAGE_NAME_4}
else
    echo "${PACKAGE_NAME_4}: インストール済み"
fi

${PACKAGE_NAME_5} -v &> /dev/null # Nodejsがインストール済みか判定
if [ $? -ne 0 ]; then
    echo "未インストールの場合"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y ${PACKAGE_NAME_5}
else
    echo "${PACKAGE_NAME_5}: インストール済み"
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx
fcitx-autostart