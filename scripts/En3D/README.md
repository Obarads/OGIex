# En3D
## Demo abstract
En3D can run an app demo with gradio.

## Demo implementation info
- Implementation: [menyifang/En3D](https://github.com/menyifang/En3D)
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
    bash run_app.sh
    ```