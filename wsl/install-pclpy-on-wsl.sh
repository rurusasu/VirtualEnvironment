#!/bin/bash

# PCL installer
# WSL2のUbuntu側で行う PCL のセットアップスクリプト
# 最終更新: 2021/08/08

sudo mkdir -p /usr/local/pytools
cd /usr/local/pytools
# 事前にパッケージが存在する場合は削除する
sudo rm -rf pclpy

# github の davidcaron/pclpy のダウンロード
sudo git clone --recursive https://github.com/davidcaron/pclpy

# 前提パッケージのインストール
cd pclpy
sudo apt -y update \
&& sudo apt -y install \
python3-pybind11 \
python3-inflection \
python3-unidecode \
python3-pytest


# conda 仮想環境作成
conda env create -n pclpy -f environment.yml
conda deactivate
conda activate pclpy
pip install -r requirements-dev.txt

# requirements-dev.txt で必要と言われる可能性のあるパッケージ
#pip install \
#CppHeaderParser \
#inflection \
#pyyaml \
#unidecode

# pclpy インストール
sudo chown -R $USER /usr/local/pytools/pclpy
#sudo mkdir -p /opt/conda/include/pcl-1.9/pcl
cd /usr/local/pytools/pclpy
bash scripts/download_pcl.sh
bash scripts/generate_points_and_bindings.sh
cd generators
PCL_REPO_PATH=/usr/local/pcl-pcl-1.9.1 PYTHONPATH=/usr/local/pytools/pclpy python3 generate_point_types.py
cd ..
