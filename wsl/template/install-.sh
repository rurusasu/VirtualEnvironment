#!/bin/bash
# Copyright (c) 2022 astherier
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
#install-〇〇.sh
#WSL2のUbuntu側で行う〇〇のセットアップスクリプト
#最終更新：2022/02/07

#インストールするパッケージ名(PACKAGE_NAME)を指定してください。
export PACKAGE_NAME=

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