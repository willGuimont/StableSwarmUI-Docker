FROM ubuntu:22.04

# Timezone
ENV TZ=America/Toronto \
    FORCE_CUDA="1" \
    TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0 7.5 8.0 8.6+PTX" \
    TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
ENV MAKEFLAGS="-j$(nproc)"
RUN apt update && apt install -y git wget dotnet-sdk-7.0 python3 python3-venv python3-pip
RUN apt update && apt install -y libgl1-mesa-glx python3-opencv libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev

# Getting StableSwarmUI
WORKDIR /app
RUN git clone https://github.com/Stability-AI/StableSwarmUI

# Launch the web installer
CMD ["./StableSwarmUI/launch-linux.sh"]
