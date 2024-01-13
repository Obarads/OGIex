# 4dfy
## Demo abstract
4dfy predicts 4D novel views of object (a video as Output) from a text (Input).

## Demo implementation info
- Implementation: [sherwinbahmani/4dfy](https://github.com/sherwinbahmani/4dfy)
  - framework: Pytorch
  - Official code: Yes
  - License: Apache License 2.0

## Demo enviroment
- GPU: RTX4090

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run the demo on Host machine bash:
    ```bash
    bash text_to_novelview.sh <an input prompt> <output dir name>
    # ex: bash text_to_novelview.sh "a space shuttle launching" outputs/demo
    ```