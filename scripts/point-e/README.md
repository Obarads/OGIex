# point-e
## Demo abstract

## Demo implementation info
- Implementation: [openai/point-e](https://github.com/openai/point-e)
  - framework: Pytorch
  - Official code: Yes
  - License: MIT License

## Demo enviroment
- GPU: RTX2080Ti

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run the demo on the host machine bash:
    ```bash
    bash image_to_point_image.sh <Input image path> <Output image path>
    # ex: bash image_to_point_image.sh impl/point_e/examples/example_data/corgi.jpg outputs/corgi.png
    ```
