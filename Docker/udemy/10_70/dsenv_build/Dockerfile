FROM ubuntu:latest

RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get install -y \
  sudo \
  wget \
  vim

# Working Directory の変更
WORKDIR /opt

# インストーラの実行
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-x86_64.sh \
  && bash Miniconda3-py39_4.11.0-Linux-x86_64.sh -b -p /opt/miniconda3 \
  && rm -f Miniconda3-py39_4.11.0-Linux-x86_64.sh

# 環境変数を追加
ENV PATH /opt/miniconda3/bin:$PATH

# conda & pip のアップデートと jupter のインストール
RUN conda upgrade -y conda \
  && conda update -y --all \
  && conda install -y jupyterlab \
  && pip install --upgrade pip

WORKDIR /

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]