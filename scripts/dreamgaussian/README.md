# dreamgaussian
Created: 2023/09/30

## Demo abstract
dreamgaussian predicts 3D data (Output) from single image (Input).

## Demo implementation info
- Implementation: [dreamgaussian/dreamgaussian](https://github.com/dreamgaussian/dreamgaussian)
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
2. (Option) If there is background on the single image, please run a command to transparent background:
    ```bash
    bash preprocess.sh <image path> <output preprocessed image dir path>
    # ex: bash preprocess.sh data/test.png data/
    ```
3. Run a prediction demo on Host machine bash (If you ran process 2, use process 2 output (XX_rgba.png) as input.):
    ```bash
    bash image_to_mesh.sh <image path> <output dir path>
    # ex: bash image_to_mesh.sh data/test_rgba.png outputs/test
    ```

## Note
None
