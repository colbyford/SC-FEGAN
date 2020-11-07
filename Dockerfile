# FROM ubuntu:20.04
# FROM tensorflow/tensorflow:1.13.0
FROM tensorflow/tensorflow:1.13.0rc2-gpu-jupyter

MAINTAINER Colby Ford

# Add user
RUN adduser --quiet --disabled-password qtuser
ENV QT_DEBUG_PLUGINS=1
ARG DEBIAN_FRONTEND=noninteractive

# Install Python 3, PyQt5
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    python3-pyqt5 \
    python3-pip \
    libxcb-icccm4
    # \    libxcb-xinerama0

RUN ln -sf /usr/lib/x86_64-linux-gnu/qt5/plugins/platforms/ /usr/bin/

COPY ./ /tmp/

RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

