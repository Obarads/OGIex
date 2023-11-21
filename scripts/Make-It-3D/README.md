# Make-It-3D
## Demo abstract

## Demo implementation info
- Implementation: [junshutang/Make-It-3D](https://github.com/junshutang/Make-It-3D)
  - framework: Pytorch
  - Official code: Yes
  - License: Not described

## Demo enviroment
- GPU: RTX2080Ti

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run a prediction demo on Host machine bash:
    ```bash
    bash image_to_novelview.sh <Input image path> <Output path>
    # ex: bash image_to_novelview.sh data/teddy.png outputs/
    ```