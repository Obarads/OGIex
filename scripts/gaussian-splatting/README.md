# gaussian-splatting
Created: 2023/09/12

## Demo abstract
gaussian-splatting outputs trained model (Output) from multi-view images (Input).

## Demo implementation info
- Implementation: [graphdeco-inria/gaussian-splatting](https://github.com/graphdeco-inria/gaussian-splatting)
  - framework: Pytorch
  - Official code: Yes
  - License: Other

## Demo enviroment
- GPU: RTX2080Ti

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Train a model from multi-view images on Host machine bash:
    ```bash
    bash train.sh <image dir path> <output dir path>
    # ex: bash train.sh data/train outputs/
    ```
3. View the result with the trained model:
    ```bash
    bash viewer.sh <trained model path>
    ```

## Note
None