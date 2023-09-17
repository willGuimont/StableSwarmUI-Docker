# Go into the venv
cd /app/StableSwarmUI/dlbackend/ComfyUI
source venv/bin/activate

# Install plugins
cd custom_nodes/
git clone https://github.com/ltdrdata/ComfyUI-Manager
git clone https://github.com/Fannovel16/comfyui_controlnet_aux
git clone https://github.com/Stability-AI/stability-ComfyUI-nodes
git clone https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes
git clone https://github.com/EllangoK/ComfyUI-post-processing-nodes

pip install -r ComfyUI-Manager/requirements.txt
pip install -r comfyui_controlnet_aux/requirements.txt
pip install -r stability-ComfyUI-nodes/requirements.txt

# Copy models
cp -r /app/output/Models/* /app/StableSwarmUI/Models
