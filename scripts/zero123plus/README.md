# zero123plus
Created: 2023/11/02

## Demo abstract
zero123plus predicts novel views of the object (a multi-view image as Output) from an image (Input).

## Demo implementation info
- Implementation: [SUDO-AI-3D/zero123plus](https://github.com/SUDO-AI-3D/zero123plus)
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
2. Run a prediction demo on Host machine bash:
    ```bash
    bash image_to_novelview.sh <output dir path>
    # ex: bash image_to_novelview.sh outputs
    ```

