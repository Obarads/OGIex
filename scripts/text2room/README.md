# text2room
## Demo abstract

## Demo implementation info
- Implementation: [lukasHoel/text2room](https://github.com/lukasHoel/text2room)
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
2. Run the demo on the container bash:
    ```bash
    bash text_to_mesh.sh <Input config file path> <Output dir path>
    # ex: bash text_to_mesh.sh impl/model/trajectories/examples/bathroom.json outputs/demo
    ```

