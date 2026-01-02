FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        ninja-build \
        git \
        python3 \
        python3.12-venv \
        python3-pip \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

# GCC 13 installieren
RUN apt-get update && \
    apt-get install -y gcc-13 g++-13 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 100

WORKDIR /workspace

# Aktuelles Conan 2
#RUN python3 -m pip install --upgrade pip
#RUN python3 -m venv .venv
#RUN source .venv/bin/activate
#RUN pip install conan


CMD ["/bin/bash"]
