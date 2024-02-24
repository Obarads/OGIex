# Wonder3D
Created: 2023/11/02

## Demo abstract
Wonder3D predicts novel views of the object (front, rear, left and right RGB and normal images as Output) from an image (Input).

## Demo implementation info
- Implementation: [xxlong0/Wonder3D](https://github.com/xxlong0/Wonder3D)
  - framework: Pytorch
  - Official code: Yes
  - License: GNU Affero General Public License v3.0

## Demo enviroment
- GPU: RTX2080Ti

## Demo process
1. Build a docker image and container, and then start the container on Host machine bash:
    ```bash
    bash docker_buildrun.sh
    ```
2. Download [ckpts folder from sharepoint](https://connecthkuhk-my.sharepoint.com/:f:/g/personal/xxlong_connect_hku_hk/Ej7fMT1PwXtKvsELTvDuzuMBebQXEkmf2IwhSjBWtKAJiA) into this folder, and then run a script on Host machine bash:
    ```bash
    bash set_ckpts.sh <ckpts zip file>
    # ex: bash set_ckpts.sh ckpts.zip
    ```
3. Run a prediction demo on Host machine bash:
    ```bash
    bash image_to_novelview.sh <output dir path>
    # ex: bash image_to_novelview.sh outputs/owl
    ```

