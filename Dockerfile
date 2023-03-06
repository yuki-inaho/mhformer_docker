FROM nvidia/cuda:11.6.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    python3-dev python3-pip git libglib2.0-0 libsm6 libxext6 libxrender-dev x11-apps \
    make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev \
    liblzma-dev python-openssl vim less \
    libfreetype6-dev libpng-dev && \
    rm -rf /var/lib/apt/lists/*

# Set up environment
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Clone repository
WORKDIR /root
RUN git clone https://github.com/Vegetebird/MHFormer.git

# Install requirements
WORKDIR /root/MHFormer
RUN pip3 install -U matplotlib && pip3 install -r requirements.txt

# Set up entrypoint
WORKDIR /root/MHFormer