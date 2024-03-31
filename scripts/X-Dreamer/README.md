# X-Dreamer
## Demo abstract
X-Dreamer predicts a 3D model (Output, ply file) from a text (Input, a config file).

## Demo implementation info
- Implementation: [xmu-xiaoma666/X-Dreamer](https://github.com/xmu-xiaoma666/X-Dreamer)
  - framework: Pytorch
  - Official code: Yes
  - License: Apache License 2.0

## Demo enviroment
- GPU: RTX2080Ti

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run demo.
    ```bash
    bash text_to_mesh.sh <input file path> <output folder path>
    # ex: bash text_to_mesh.sh impl/configs/cupcake_geometry.json outputs
    ```
