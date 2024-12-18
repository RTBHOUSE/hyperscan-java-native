#!/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t hyperscan-java-native:latest .
docker run --rm -t -i -v $(pwd):/build hyperscan-java-native:latest /bin/bash -c "
cd /build/
source /venv/bin/activate
DETECTED_PLATFORM=linux-x86_64 ./build.sh
"
