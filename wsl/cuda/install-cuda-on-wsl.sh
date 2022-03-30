#!/bin/bash
# Copyright (c) 2021 astherier
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
#install-cuda-on-wsl.sh
#WSL2のUbuntu側で行うCUDA on WSLのセットアップスクリプト
#最終更新：2022/03/30
#https://astherier.com/blog/2021/07/windows11-cuda-on-wsl2-setup/

#CUDAリポジトリ名(DISTRO)とインストールするパッケージ名(APT_INSTALL)を指定してください。
#リポジトリ名を変更した場合、パッケージ名は明示的にCUDAツールキットを指定してください。
#(wsl-ubuntu以外のリポジトリから「cuda」をインストールすると、ディスプレイドライバーまでインストールしようとしてしまうため)
export DISTRO=wsl-ubuntu
export APT_INSTALL=cuda
export CUDA_VERSION_MAJOR=11
export CUDA_VERSION_MINOR=6
export CUDA_UPDATE_NUMBER=2
# CUDA 11.6 => CUDA_VERSION_MINOR=6, UPDATE_NUMBER=0
# CUDA 11.6 update 1 => CUDA_VERSION_MINOR=6, UPDATE_NUMBER=1
# CUDA 11.6 update 2 => CUDA_VERSION_MINOR=6, UPDATE_NUMBER=2

#CUDAリポジトリの登録
#Origファイルより更新(NVIDIAのサイト準拠に変更)
#https://docs.nvidia.com/cuda/wsl-user-guide/index.html
wget https://developer.download.nvidia.com/compute/cuda/repos/${DISTRO}/x86_64/cuda-${DISTRO}.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/${CUDA_VERSION_MAJOR}.${CUDA_VERSION_MINOR}.${CUDA_UPDATE_NUMBER}/local_installers/cuda-repo-wsl-ubuntu-${CUDA_VERSION_MAJOR}-${CUDA_VERSION_MINOR}-local_${CUDA_VERSION_MAJOR}.${CUDA_VERSION_MINOR}.${CUDA_UPDATE_NUMBER}-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-${CUDA_VERSION_MAJOR}-${CUDA_VERSION_MINOR}-local_${CUDA_VERSION_MAJOR}.${CUDA_VERSION_MINOR}.${CUDA_UPDATE_NUMBER}-1_amd64.deb
sudo apt-key add /var/cuda-repo-wsl-ubuntu-${CUDA_VERSION_MAJOR}-${CUDA_VERSION_MINOR}-local/7fa2af80.pub

#CUDAツールキットのインストール
sudo apt update && sudo apt -y upgrade
sudo apt install -y ${APT_INSTALL}

#環境変数の設定
cat << 'EOS' >> ~/.profile

#Added by install-cuda-on-wsl.sh
#Ref: https://astherier.com/blog/2021/07/windows11-cuda-on-wsl2-setup/
export PATH=/usr/local/cuda-11.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.6/lib64\
            ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#Added: end

EOS

# debファイルの削除
sudo rm cuda-repo-wsl-ubuntu-${CUDA_VERSION_MAJOR}-${CUDA_VERSION_MINOR}-local_${CUDA_VERSION_MAJOR}.${CUDA_VERSION_MINOR}.0-1_amd64.deb

#サードパーティーライブラリのインストール（任意）
sudo apt install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

#サンプルプログラムのビルド（任意）
cd /usr/local/cuda/samples/1_Utilities/deviceQuery/
sudo make
cd /usr/local/cuda/samples/1_Utilities/bandwidthTest/
sudo make
cd /usr/local/cuda/samples/7_CUDALibraries/simpleCUBLAS/
sudo make
cd /usr/local/cuda/samples/7_CUDALibraries/simpleCUFFT/
sudo make

cd /usr/local/cuda/samples/bin/x86_64/linux/release/

echo "

CUDA on WSLのセットアップが終了しました。
いくつかサンプルをコンパイルしていますので、正常に動くか確認してください。
（例）
$ cd /usr/local/cuda/samples/bin/x86_64/linux/release/
$ ./deviceQuery

"