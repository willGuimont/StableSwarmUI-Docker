FROM ubuntu:22.04

# Timezone
ENV TZ=America/Toronto \
    FORCE_CUDA="1" \
    TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0 7.5 8.0 8.6+PTX" \
    TORCH_NVCC_FLAGS="-Xfatbin -compress-all" \
    DOTNET_CLI_TELEMETRY_OPTOUT=1
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
ENV MAKEFLAGS="-j$(nproc)"
RUN apt update && apt install -y git wget dotnet-sdk-8.0 python3 python3-venv python3-pip apt-transport-https
RUN apt update && apt install -y libgl1-mesa-glx python3-opencv libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev

# Getting StableSwarmUI
WORKDIR /app
RUN git clone https://github.com/mcmonkeyprojects/SwarmUI/
COPY ./install_plugins.sh /app/

# Launch the web installer
CMD ["./SwarmUI/launch-linux.sh"]
