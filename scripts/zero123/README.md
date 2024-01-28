# zero123
## Demo abstract
This demo predicts the novel view of the object (front a RGB image as Output) from an image (Input) with gradio demo.

## Demo implementation info
- Implementation: [cvlab-columbia/zero123](https://github.com/cvlab-columbia/zero123)
  - framework: Pytorch
  - Official code: Yes
  - License: MIT License

## Demo enviroment
- GPU: RTX4090

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash (Note: use port 7860 for gradio demo):
    ```bash
    bash docker_buildrun.sh
    ```
2. Run gradio demo on Host machine bash:
    ```bash
    bash start_gradio.sh
    ```
3. Access the gradio demo on Host machine browser: http://127.0.0.1:7860/