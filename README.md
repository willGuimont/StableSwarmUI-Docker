# StableSwarmUI Dockerfile

## Running

```bash
docker-compose up --build
# then open http://localhost:7801 and run the installation
```

Presets are downloaded in `/app`, load them
following [Presets](https://github.com/Stability-AI/StableSwarmUI/blob/master/docs/Presets.md).

You can connect an additional TTY to the container using:

```bash
docker exec -it <name> bash
```

You can download plugins for comfyui at [civitai](https://civitai.com/tag/comfyui), or models
at [civitai](https://civitai.com/).

`/app/output` is a volume mapped to `./output/`, so you can use it to transfert data from and to the container.

Introduction to ComfyUI [video](https://www.youtube.com/watch?v=2Xe79Nl_6jA), with a pipeline using refiner.
