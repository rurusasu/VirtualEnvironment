#!/bin/bash

# PCL installer
# WSL2のUbuntu側で行う PCL のセットアップスクリプト
# 最終更新: 2021/08/08

# 必要なパッケージのインストール
sudo apt -y update && \
sudo apt -y upgrade && \
sudo apt -y install --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Dockerリポジトリの証明書が信頼されていることを確認
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# OK の場合、パッケージで使用可能なリポジトリのリストにDockerリポジトリを追加
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# パッケージを更新し、DockerとDockerCLIをインストール
sudo apt -y update && \
sudo apt -y install --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

# Docker デーモンを起動
sudo service docker start

# dockerという名前のDockerグループにユーザーを追加
sudo usermod -aG docker $USER