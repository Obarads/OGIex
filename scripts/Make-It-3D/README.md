# Make-It-3D
Created: 2023/11/25

## Demo abstract
Make-It-3D predicts novel view images (Output) from a single image (Input).

## Demo implementation info
- Implementation: [junshutang/Make-It-3D](https://github.com/junshutang/Make-It-3D)
  - framework: Pytorch
  - Official code: Yes
  - License: Not described

## Demo enviroment
- GPU: RTX4090

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run a prediction demo on Host machine bash:
    ```bash
    bash image_to_novelview.sh <Input image path> <Output path>
    # ex: bash image_to_novelview.sh impl/demo/teddy.png outputs/
    ```
