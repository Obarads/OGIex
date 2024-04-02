# LucidDreamer
## Demo abstract

## Demo implementation info
- Implementation: [luciddreamer-cvlab/LucidDreamer](https://github.com/luciddreamer-cvlab/LucidDreamer)
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
2. Run demo.
    ```bash
    bash text_to_3d.sh <input_file_path> <output_file_path>
    # ex: bash text_to_3d.sh impl/examples/cabin.txt outputs
    ```