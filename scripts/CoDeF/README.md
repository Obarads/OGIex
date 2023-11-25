# CoDeF
Created: 2023/11/21

## Demo abstract
Codef predicts the style transformed video (Output) from a video and an image (Input).

## Demo implementation info
- Implementation: [qiuyu96/CoDeF](https://github.com/qiuyu96/CoDeF)
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
2. Run the style transformation demo for a video on the host machine bash:
    ```bash
    bash video_to_video.sh <Output path>
    # ex: bash video_to_video.sh outputs
    ```
