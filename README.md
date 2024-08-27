# StableSwarmUI Dockerfile

## Running

```bash
docker-compose up --build
# then open http://localhost:7801 and run the installation
```

`/app/output` is a volume mapped to `./output/`, so you can use it to transfert data from and to the container.

**To avoid having to download the models each time**, you can copy them to `/app/output`, and then copy them back when
you run the container again.

```bash
# After install, start a bash TTY
docker exec -it <container-id> bash

# Copy the models to output
mkdir /app/output/Models
cp -r /app/StableSwarmUI/Models/* /app/output/Models

# Then make models available with a symlink
rm -rf /app/StableSwarmUI/Models
ln -s /app/output/Models /app/StableSwarmUI/Models
```

## Additional notes

### Presets

You can download presets using:

```bash
wget https://gist.githubusercontent.com/mcmonkey4eva/b63c786871e2b75cdf2622a2052620aa/raw/76be3fded8ff9b242509a50326ae4c723fd781c6/SDXL%2520Official%2520Presets.json
```

Follow [Presets](https://github.com/Stability-AI/StableSwarmUI/blob/master/docs/Presets.md) for instructions about
loading them.

### Useful resources

- Video introducing how to use a refiner in ComfyUI
  [SDXL ComfyUI Stability Workflow - What I use internally at Stability for my AI Art](https://www.youtube.com/watch?v=2Xe79Nl_6jA).
- Plugins for comfyui at [civitai](https://civitai.com/tag/comfyui), or models at [civitai](https://civitai.com/).
- [lexica](https://lexica.art/) for prompt ideas.
- Additional models and lora can be downloaded at [civitai](https://civitai.com/)

### Installing plugins

Necessary to run [ControlNet](https://huggingface.co/stabilityai/control-lora).

```bash
# Start a bash interpreter
docker-compose run --build app bash

# Install then quit
/app/SwarmUI/launch-linux.sh

# Open and install at http://localhost:7801
# Close the server with Ctrl+C

# Install plugins
/app/install_plugins.sh

# Open and install at http://localhost:7801

# Start again
/app/SwarmUI/launch-linux.sh
```
