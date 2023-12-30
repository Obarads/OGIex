# LucidDreamer
## Demo abstract
LucidDreamer predicts novel views of the object (360 degree video as Output) from text (config file as Input).

## Demo implementation info
- Implementation: [EnVision-Research/LucidDreamer](https://github.com/EnVision-Research/LucidDreamer)
  - framework: Pytorch
  - Official code: Yes
  - License: MIT License

## Demo enviroment
- GPU: RTX4090

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run a prediction demo on Host machine bash:
    ```bash
    bash text_to_novelview.sh <config_file_path> <output_dir_path>
    # ex: bash text_to_novelview.sh impl/configs/axe.yaml ouputs/
    ```
