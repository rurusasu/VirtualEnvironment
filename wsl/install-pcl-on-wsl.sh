#!/bin/bash

# PCL installer
# WSL2のUbuntu側で行う PCL のセットアップスクリプト
# 最終更新: 2021/08/08

# 必要なパッケージのインストール
sudo apt -y update && \
sudo apt -y install \
build-essential \
cmake \
git \
libboost-all-dev \
libeigen3-dev \
libflann-dev \
libvtk7-dev \
p7zip-full

cd /usr/local
# 事前にパッケージが存在する場合は削除する
sudo rm -rf pcl-pcl-1.9.1

# PCLをダウンロードする
cd /tmp
curl -O -L https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.9.1.tar.gz

# PCL をインストールする
cd /usr/local
sudo tar -xvzof /tmp/pcl-1.9.1.tar.gz

# パス設定をする
sudo chown -R $USER pcl-pcl-1.9.1

# PCL をビルドする
cd pcl-pcl-1.9.1
sudo mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j2
sudo make install