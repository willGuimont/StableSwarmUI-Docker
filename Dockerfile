FROM ubuntu:22.04

ENV MAKEFLAGS="-j$(nproc)"
RUN apt update && apt install -y git wget python3 dotnet-sdk-7.0 python3-venv python3-pip
WORKDIR /app

RUN git clone https://github.com/Stability-AI/StableSwarmUI
CMD ["./StableSwarmUI/launch-linux.sh"]
