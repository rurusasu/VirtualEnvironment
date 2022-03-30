#!/bin/bash

# Miniconda3 installer
# WSL2のUbuntu側で行う Miniconda のセットアップスクリプト
# 最終更新: 2022/02/19

export VERSION=latest
export SHA256SUM=4ee9c3aa53329cd7a63b49877c0babb49b19b7e5af29807b793a76bdb1d362b4
export MINICONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-${VERSION}-Linux-x86_64.sh

# Miniconda の保存先
DSTDIR=/opt

# miniconda ダウンロード
# REF: https://github.com/ContinuumIO/docker-images/blob/master/miniconda3/debian/Dockerfile
# Package-URL: https://docs.conda.io/en/latest/miniconda.html
echo "miniconda のダウンロードを開始します．"
wget "${MINICONDA_URL}" -O miniconda.sh -q && \
echo "${SHA256SUM} miniconda.sh" > shasum && \
sha256sum --check --status shasum

echo "miniconda のインストール先のディレクトリを作成します．"
sudo rm -r $DSTDIR && \
# minicondaインストール先のディレクトリの作成
sudo mkdir -p $DSTDIR

echo "miniconda のインストールを開始します．"
# miniconda インストール
sudo bash miniconda.sh -b -p $DSTDIR/conda && \
rm miniconda.sh shasum && \
# シンボリックリンクを作成
sudo ln -s $DSTDIR/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

#環境変数の設定
cat << 'EOS' >> ~/.profile

#Added by install-miniconda-on-wsl.sh
export PATH=opt/conda/bin:$PATH
#Added: end

EOS

echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
echo "conda activate base" >> ~/.bashrc

# Path 設定
# REF: https://codehero.jp/anaconda/55290271/updating-anaconda-fails-environment-not-writable-error
sudo chown -R $USER:$USER $DSTDIR/conda

# 不要なパッケージをアンインストール
find $DSTDIR/conda/ -follow -type f -name '*.a' -delete && \
find $DSTDIR/conda/ -follow -type f -name '*.js.map' -delete && \
$DSTDIR/conda/bin/conda clean -afy
