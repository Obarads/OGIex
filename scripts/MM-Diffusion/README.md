# MM-Diffusion
Created: 2023/09/29

## Demo abstract
MM-Diffusion predicts movies (Output) from audio (Input, Not confirmed.).

## Demo enviroment
- GPU: RTX4090

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run a prediction demo on Host machine bash:
    ```bash
    bash run.sh
    # ex: bash run.sh
    ```
