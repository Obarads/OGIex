# threestudio
Created: 2023/11/04

## Demo abstract
threestudio predicts novel views of the object (360 degree video as Output) from text (Input).

## Demo implementation info
- Implementation: [threestudio-project/threestudio](https://github.com/threestudio-project/threestudio)
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
2. Run a prediction demo on Host machine bash:
    ```bash
    bash text_to_novelview.sh <Input prompt> <Output path>
    # ex: bash text_to_novelview.sh "a zoomed out DSLR photo of a baby bunny sitting on top of a stack of pancakes" outputs
    ```
