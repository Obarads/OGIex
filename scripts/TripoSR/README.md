# TripoSR
## Demo abstract
TripoSR predicts a 3D model (Output, ply file) from an image (Input, png file).

## Demo implementation info
- Implementation: [VAST-AI-Research/TripoSR](https://github.com/VAST-AI-Research/TripoSR)
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
2. Run a prediction demo on Host machine bash:
    ```bash
    bash image_to_3d.sh <input image path> <output dir path>
    # ex: bash image_to_3d.sh impl/examples/hamburger.png outputs
    ```