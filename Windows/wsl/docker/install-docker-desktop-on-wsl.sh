export DOCKER_VERSION_MAJOR=4
export DOCKER_VERSION_MINOR=10
export DOCKER_UPDATE_NUMBER=1
export ARCH=amd64

#sudo apt remove docker-desktop

#rm -r $HOME/.docker/desktop
#sudo rm /usr/local/bin/com.docker.cli
#sudo apt purge docker-desktop

# wsl で実行する場合、systemdを先に実行しておく必要がある
# REF:
# (WSL2+Ubuntu22.04に標準で入ったsystemdを試す)
# [https://qiita.com/shigeokamoto/items/ca2211567771cf40a90d]
sudo /usr/libexec/wsl-systemd
/usr/libexec/nslogin

# パッケージインデックスを更新し、HTTPS経由でリポジトリを使用できるようにパッケージをインストールします。
sudo apt-get update && \
sudo apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# ドッカーの公式GPGキーを追加します。
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 次のコマンドを使用して、リポジトリを設定します。
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update && \
sudo apt install gnome-terminal && \
curl -fsSL https://desktop.docker.com/linux/main/amd64/docker-desktop-${DOCKER_VERSION_MAJOR}.${DOCKER_VERSION_MINOR}.${DOCKER_UPDATE_NUMBER}-${ARCH}.deb --output docker-desktop.deb && \
sudo apt-get install -y ./docker-desktop.deb
