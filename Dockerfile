# FROM ubuntu:20.04
# FROM tensorflow/tensorflow:1.13.0
FROM tensorflow/tensorflow:1.13.0rc2-gpu-jupyter

MAINTAINER Colby Ford

# Add user
RUN adduser --quiet --disabled-password qtuser
ARG DEBIAN_FRONTEND=noninteractive

# Install Python 3, PyQt5
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    python3-pyqt5 \
    python3-pip

COPY ./ /tmp/

RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

