FROM maven:3.9.9-eclipse-temurin-22-jammy

ARG UID
ARG GID

RUN apt-get update \
 && apt-get install -y \
        build-essential \
        curl \
        git \
        pkg-config \
        python3 \
        python3-venv \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /venv \
 && . /venv/bin/activate \
 && python3 -m pip install cmake==3.18.4

RUN groupadd -g $GID builder \
 && useradd -m -u $UID -g $GID -s /bin/bash builder

USER builder
