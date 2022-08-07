FROM ubuntu:latest

RUN apt-get -y update && \
  apt-get -y upgrade && \
  apt-get install -y \
  sudo \
  wget \
  vim

WORKDIR /opt

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-x86_64.sh