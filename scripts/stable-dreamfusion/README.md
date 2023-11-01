# stable-dreamfusion
## Demo abstract
stable-dreamfusion predicts novel views of the object (360 degree video as Output) from text (Input).

## Demo implementation info
- Implementation: [ashawkey/stable-dreamfusion](https://github.com/ashawkey/stable-dreamfusion)
  - framework: Pytorch
  - Official code: No
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
    bash text_to_novelview.sh <text> <output dir path>
    # ex: bash text_to_novelview.sh "a hamburger" outputs/hamburger
    ```

## Note
None
