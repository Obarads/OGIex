# One-2-3-45
Created: 2023/09/21

## Demo abstract
One-2-3-45 predicts a mesh data of the 3D object (Output) from a single image (Input).

## Demo implementation info
- Implementation: [One-2-3-45/One-2-3-45](https://github.com/One-2-3-45/One-2-3-45)
  - framework: Pytorch
  - Official code: Yes
  - License: Apache License 2.0

## Demo enviroment
- GPU: RTX4090

## Demo process
**Note** : [Please install git lfs first.](https://github.com/git-lfs/git-lfs/wiki/Installation#debian-and-ubuntu)

1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Run the demo on the host machine bash:
    ```bash
    bash image_to_novelview.sh 
    # ex: bash image_to_novelview.sh impl/demo/demo_examples/01_wild_hydrant.png outputs/
    ```
