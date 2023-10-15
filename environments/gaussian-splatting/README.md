# gaussian-splatting
## Demo abstract
gaussian-splatting outputs trained model (Output) from multi-view images (Input).

## Demo enviroment
- GPU: RTX2080Ti

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
3. Train a model from multi-view images on Host machine bash:
    ```bash
    bash train.sh <image dir path> <output dir path>
    # ex: bash train.sh assets outputs/
    ```

