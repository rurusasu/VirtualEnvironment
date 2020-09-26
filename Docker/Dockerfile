FROM continuumio/miniconda3

RUN conda install -y tensorflow-gpu


ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES utility,compute