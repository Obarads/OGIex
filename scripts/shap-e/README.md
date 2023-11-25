# shap-e
Created: 2023/11/21

## Demo abstract
shap-e predicts novel views of the object (a GIF image as Output) from an image (Input).

## Demo implementation info
- Implementation: [openai/shap-e](https://github.com/openai/shap-e)
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
2. Run the demo on the Host machine bash:
    ```bash
    bash image_to_novelview.sh <Input image path> <Output gif image path>
    # ex: bash image_to_novelview.sh impl/shap_e/examples/example_data/corgi.png outputs/corgi.gif
    ```
