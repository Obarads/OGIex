# realfusion
Created: 2023/09/21

## Demo abstract
realfusion predicts novel views of the object (Output) from a single real image (Input).

## Demo implementation info
- Implementation: [lukemelas/realfusion](https://github.com/lukemelas/realfusion)
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
2. Run a command to transparent background from Host machine bash:
    ```bash
    bash preprocess.sh <image file path> <output dir path>
    # ex: bash preprocess.sh data/image.png outputs/preprocess/bird
    ```
3. Run a prediction demo on Host machine bash:
    ```bash
    bash image_to_novelview.sh <preprocess dir path> <output dir path>
    # ex: bash image_to_mesh.sh outputs/preprocess/bird outputs/demo/bird
    ```

## Note
None