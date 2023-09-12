FROM ubuntu:22.04

RUN apt update && apt install -y wget

ENV MAKEFLAGS="-j$(nproc)"
RUN apt update && apt install -y git wget python3 dotnet-sdk-7.0 python3-venv python3-pip
WORKDIR /app

RUN wget https://gist.githubusercontent.com/mcmonkey4eva/b63c786871e2b75cdf2622a2052620aa/raw/76be3fded8ff9b242509a50326ae4c723fd781c6/SDXL%2520Official%2520Presets.json
RUN git clone https://github.com/Stability-AI/StableSwarmUI

CMD ["./StableSwarmUI/launch-linux.sh"]
