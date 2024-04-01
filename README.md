# OGIex
![Shell Script](https://img.shields.io/badge/Shell%20Script-2c2c2c?logo=gnu-bash&logoColor=white&style=flat-square)
![tested](https://img.shields.io/badge/Tested_on-Ubuntu-red?style=flat-square)
![License](https://img.shields.io/github/license/Obarads/OGIex?color=green&style=flat-square)

- OGIex are scripts from building a docker image to running a demo of paper implementations by three or fewer commands and works.
- For example, you can get a prediction result of [stable-dreamsfusion](scripts/stable-dreamfusion/README.md) by two commands:
    ```bash
    # stage 1: build a docker image and start a docker container.
    bash docker_buildrun.sh
    # stage 2: predict a 3D object from a text (a hamburger), and then output a result into output dir (outputs/hamburger).
    bash text_to_novelview.sh "a hamburger" outputs/hamburger
    ```

## How to use
1. Git clone this repository: 
    ```bash
    git clone https://github.com/Obarads/OGIex.git
    ```
2. Select a method that you want to run from the `Script dir list` section, and then move current dir to the method dir. For example, if you want to run `stable-dreamsfusion`, you can run the following command:
    ```bash
    cd OGIex/scripts/stable-dreamfusion
    ```
3. Run the commands in a `README.md` of the method dir. For example, you can run a demo of `stable-dreamsfusion` by two commands:
    ```bash
    # stage 1: build a docker image and start a docker container.
    bash docker_buildrun.sh

    # stage 2: predict a 3D object from a text (a hamburger), and then output a result into output dir (outputs/hamburger).
    bash text_to_novelview.sh "a hamburger" outputs/hamburger
    ```

## Script dir list
The list of available scripts is below. `Dirname`, `Code`, and `Paper` columns denote script directory links, implementation links, and article links, respectively.

| Dirname                                                                                | Code                                                                            | Paper                                                                                                                                                            | status |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| 1~0                                                                                    |                                                                                 |                                                                                                                                                                  |        |
| [4dfy](./scripts/4dfy/README.md)                                                       | [Official](https://github.com/sherwinbahmani/4dfy)                              | [4D-fy: Text-to-4D Generation Using Hybrid Score Distillation Sampling](https://arxiv.org/abs/2311.17984)                                                        | o      |
| C・c                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [CoDeF](./scripts/CoDeF/README.md)                                                     | [Official](https://github.com/qiuyu96/CoDeF)                                    | [CoDeF: Content Deformation Fields for Temporally Consistent Video Processing](https://arxiv.org/abs/2308.07926)                                                 | o      |
| [colmap](./scripts/colmap/README.md)                                                   | [Official](https://github.com/colmap/colmap)                                    | [Pixelwise View Selection for Unstructured Multi-View Stereo](https://demuc.de/papers/schoenberger2016mvs.pdf)                                                   | x      |
| [Customize-it-3D](./scripts/Customize-it-3D/README.md)                                 | [Official](https://github.com/nnanhuang/Customize-it-3D)                        | [Customize-It-3D: High-Quality 3D Creation from A Single Image Using Subject-Specific Knowledge Prior](https://arxiv.org/abs/2312.11535)                         | -      |
| D・c                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [dreamgaussian](./scripts/dreamgaussian/README.md)                                     | [Official](https://github.com/dreamgaussian/dreamgaussian)                      | [DreamGaussian: Generative Gaussian Splatting for Efficient 3D Content Creation](https://arxiv.org/abs/2309.16653)                                               | o      |
| [DreamPropeller](./scripts/DreamPropeller/README.md)                                   | [Official](https://github.com/alexzhou907/DreamPropeller)                       | [DreamPropeller: Supercharge Text-to-3D Generation with Parallel Sampling](https://arxiv.org/abs/2311.17082)                                                     | -      |
| E・e                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [En3D](./scripts/En3D/README.md)                                                       | [Official](https://github.com/menyifang/En3D)                                   | [En3D: An Enhanced Generative Model for Sculpting 3D Humans from 2D Synthetic Data](https://arxiv.org/abs/2401.01173)                                            | o      |
| G・g                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [gaussian-splatting](./scripts/gaussian-splatting/README.md)                           | [Official](https://github.com/graphdeco-inria/gaussian-splatting)               | [3D Gaussian Splatting for Real-Time Radiance Field Rendering](https://arxiv.org/abs/2308.04079)                                                                 | o      |
| H・h                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [HarmonyView](./scripts/HarmonyView/README.md)                                         | [Official](https://github.com/byeongjun-park/HarmonyView)                       | [HarmonyView: Harmonizing Consistency and Diversity in One-Image-to-3D](https://arxiv.org/abs/2312.15980)                                                        | o      |
| L・l                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [LucidDreamer](./scripts/LucidDreamer/README.md)                                       | [Official](https://github.com/EnVision-Research/LucidDreamer)                   | [LucidDreamer: Towards High-Fidelity Text-to-3D Generation via Interval Score Matching](https://arxiv.org/abs/2311.11284)                                        | o      |
| [luciddreamer-cvlab_LucidDreamer](./scripts/luciddreamer-cvlab_LucidDreamer/README.md) | [Official](https://github.com/luciddreamer-cvlab/LucidDreamer)                  | [LucidDreamer: Domain-free Generation of 3D Gaussian Splatting Scenes](https://arxiv.org/abs/2311.13384)                                                         | x      |
| M・m                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [Make-It-3D](./scripts/Make-It-3D/README.md)                                           | [Official](https://github.com/junshutang/Make-It-3D)                            | [Make-It-3D: High-Fidelity 3D Creation from A Single Image with Diffusion Prior](https://arxiv.org/abs/2303.14184)                                               | o      |
| [MM-Diffusion](./scripts/MM-Diffusion/README.md)                                       | [Official](https://github.com/researchmm/MM-Diffusion)                          | [MM-Diffusion: Learning Multi-Modal Diffusion Models for Joint Audio and Video Generation](https://arxiv.org/abs/2212.09478)                                     | o      |
| N・n                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [nerfstudio](./scripts/nerfstudio/README.md)                                           | [Official](https://github.com/nerfstudio-project/nerfstudio?tab=readme-ov-file) | [Nerfstudio: A Modular Framework for Neural Radiance Field Development](https://arxiv.org/abs/2302.04264)                                                        | x      |
| O・o                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [One-2-3-45](./scripts/One-2-3-45/README.md)                                           | [Ofiicial](https://github.com/One-2-3-45/One-2-3-45)                            | [One-2-3-45: Any Single Image to 3D Mesh in 45 Seconds without Per-Shape Optimization](https://arxiv.org/abs/2306.16928)                                         | o      |
| P・p                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [Point-Bind_Point-LLM](./scripts/Point-Bind_Point-LLM/README.md)                       | [Official](https://github.com/ZiyuGuo99/Point-Bind_Point-LLM)                   | [Point-Bind & Point-LLM: Aligning Point Cloud with Multi-modality for 3D Understanding, Generation, and Instruction Following](https://arxiv.org/abs/2309.00615) | o      |
| [point-e](./scripts/point-e/README.md)                                                 | [Official](https://github.com/openai/point-e)                                   | [Point-E: A System for Generating 3D Point Clouds from Complex Prompts](https://arxiv.org/abs/2212.08751)                                                        | o      |
| R・r                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [realfusion](./scripts/realfusion/README.md)                                           | [Official](https://github.com/lukemelas/realfusion)                             | [RealFusion: 360° Reconstruction of Any Object from a Single Image](https://arxiv.org/abs/2302.10663)                                                            | o      |
| [richdreamer](./scripts/richdreamer/README.md)                                         | [Official](https://github.com/modelscope/richdreamer)                           | [RichDreamer: A Generalizable Normal-Depth Diffusion Model for Detail Richness in Text-to-3D](https://arxiv.org/abs/2311.16918)                                  | x      |
| S・s                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [shap-e](./scripts/shap-e/README.md)                                                   | [Official](https://github.com/openai/shap-e)                                    | [Shap-E: Generating Conditional 3D Implicit Functions](https://arxiv.org/abs/2305.02463)                                                                         | o      |
| [stable-dreamfusion](./scripts/stable-dreamfusion/README.md)                           | [Unofficial](https://github.com/ashawkey/stable-dreamfusion)                    | [DreamFusion: Text-to-3D using 2D Diffusion](https://arxiv.org/abs/2209.14988)                                                                                   | o      |
| [SyncDreamer](./scripts/SyncDreamer/README.md)                                         | [Official](https://github.com/liuyuan-pal/SyncDreamer)                          | [SyncDreamer: Generating Multiview-consistent Images from a Single-view Image](https://arxiv.org/abs/2309.03453)                                                 | x      |
| T・t                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [text2room](./scripts/text2room/README.md)                                             | [Official](https://github.com/lukasHoel/text2room)                              | [Text2Room: Extracting Textured 3D Meshes from 2D Text-to-Image Models](https://arxiv.org/abs/2303.11989)                                                        | o      |
| [threestudio](./scripts/threestudio/)                                                  | [Official](https://github.com/threestudio-project/threestudio)                  | [threestudio](https://github.com/threestudio-project/threestudio)                                                                                                | o      |
| [TripoSR](./scripts/TripoSR/README.md)                                                 | [Official](https://github.com/VAST-AI-Research/TripoSR)                         | [TripoSR: Fast 3D Object Reconstruction from a Single Image](https://arxiv.org/abs/2403.02151)                                                                   | o      |
| W・w                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [Wonder3D](./scripts/Wonder3D/README.md)                                               | [Official](https://github.com/xxlong0/Wonder3D)                                 | [Wonder3D: Single Image to 3D using Cross-Domain Diffusion](https://arxiv.org/abs/2310.15008)                                                                    | o      |
| X・x                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [X-Dreamer](./scripts/X-Dreamer/README.md)                                             | [Official](https://github.com/xmu-xiaoma666/X-Dreamer)                          | [X-Dreamer: Creating High-quality 3D Content by Bridging the Domain Gap Between Text-to-2D and Text-to-3D Generation](https://arxiv.org/abs/2312.00085)          | o      |
| Z・z                                                                                   |                                                                                 |                                                                                                                                                                  |        |
| [zero123](./scripts/zero123/README.md)                                                 | [Official](https://github.com/cvlab-columbia/zero123)                           | [Zero-1-to-3: Zero-shot One Image to 3D Object](https://arxiv.org/abs/2303.11328)                                                                                | o      |
| [zero123plus](./scripts/zero123plus/README.md)                                         | [Official](https://github.com/SUDO-AI-3D/zero123plus)                           | [Zero123++: A Single Image to Consistent Multi-view Diffusion Base Model](https://arxiv.org/abs/2310.15110)                                                      | o      |
