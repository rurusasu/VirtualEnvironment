#!/bin/bash
#
# create-env-on-wsl.sh
# WSL2のUbuntu上のcondaを使って仮想環境を自動作成するスクリプト
# 最終更新: 2021/08/24

# 仮想環境名(VM_NAME)とインストールするpythonのバージョン(PY_VER)を指定してください。
export VM_NAME=net
export PY_VER=3.9
# 仮想環境を一度削除
conda deactivate
conda remove -yn ${VM_NAME} --all
# 不要になったパッケージも削除
conda clean --all
# 再度仮想環境を作成
conda create -yn ${VM_NAME} python=${PY_VER}
# 仮想環境を有効にする
conda activate ${VM_NAME}

# pytorch をインストールする．
pip3 install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

# 追加パッケージをインストールする
if [ -f ./requirements.txt ]; then
  pip3 install --upgrade pip && \
  pip3 install -r requirements.txt
fi

# 構築した環境のパッケージのアップデート
pip3 install pip-review
pip-review --auto