# Go into the venv
cd /app/SwarmUI/dlbackend/ComfyUI || exit 1
source venv/bin/activate
pip install torch torchvision torchaudio xformers

# Install plugins
cd custom_nodes/
git clone https://github.com/ltdrdata/ComfyUI-Manager
git clone https://github.com/Fannovel16/comfyui_controlnet_aux
git clone https://github.com/Stability-AI/stability-ComfyUI-nodes
git clone https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes
git clone https://github.com/EllangoK/ComfyUI-post-processing-nodes
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git
git clone https://github.com/LucianoCirino/efficiency-nodes-comfyui

pip install -r ComfyUI-Manager/requirements.txt
pip install -r comfyui_controlnet_aux/requirements.txt
pip install -r stability-ComfyUI-nodes/requirements.txt
pip install -r efficiency-nodes-comfyui/requirements.txt

# Make models available
rm -rf /app/SwarmUI/Models
ln -s /app/output/Models /app/SwarmUI/Models
