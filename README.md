# OGIex
![Shell Script](https://img.shields.io/badge/Shell%20Script-2c2c2c?logo=gnu-bash&logoColor=white&style=flat-square)
![tested](https://img.shields.io/badge/Tested_on-Ubuntu-red?style=flat-square)
![License](https://img.shields.io/github/license/Obarads/OGIex?color=green&style=flat-square)

OGIex are scripts from building a docker image to running a demo of paper implementations by three or fewer commands and works. For example, you can get a prediction result of [stable-dreamsfusion](scripts/stable-dreamfusion/README.md) by two commands:

```bash
# stage 1: build a docker image and start a docker container.
bash docker_buildrun.sh
# stage 2: predict a 3D object from a text (a hamburger), and then output a result into output dir (outputs/hamburger).
bash text_to_novelview.sh "a hamburger" outputs/hamburger
```

## How to use
1. Select a script dir in the `environments` dir.
2. Check a `README.md` written commands to run scripts in the folder.

## Script dir list
The list of available scripts is below. `Dirname`, `Code`, and `Paper` columns denote script directory links, implementation links, and article links, respectively.

| Dirname                                                 | Code                                                              | Paper                                                                                                                                                            |
| ------------------------------------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [dreamgaussian](./scripts/dreamgaussian)                | [Official](https://github.com/dreamgaussian/dreamgaussian)        | [DreamGaussian: Generative Gaussian Splatting for Efficient 3D Content Creation](https://arxiv.org/abs/2309.16653)                                               |
| [gaussian-splatting](./scripts/gaussian-splatting)      | [Official](https://github.com/graphdeco-inria/gaussian-splatting) | [3D Gaussian Splatting for Real-Time Radiance Field Rendering](https://arxiv.org/abs/2308.04079)                                                                 |
| [Wonder3D](./scripts/Wonder3D)                          | [Official](https://github.com/xxlong0/Wonder3D)                   | [Wonder3D: Single Image to 3D using Cross-Domain Diffusion](https://arxiv.org/abs/2310.15008)                                                                    |
| [stable-dreamfusion](./scripts/stable-dreamfusion)      | [Unofficial](https://github.com/ashawkey/stable-dreamfusion)      | [DreamFusion: Text-to-3D using 2D Diffusion](https://arxiv.org/abs/2209.14988)                                                                                   |
| [zero123plus](./scripts/zero123plus)                    | [Official](https://github.com/SUDO-AI-3D/zero123plus)             | [Zero123++: A Single Image to Consistent Multi-view Diffusion Base Model](https://arxiv.org/abs/2310.15110)                                                      |
| [Point-Bind_Point-LLM](./scripts/Point-Bind_Point-LLM/) | [Official](https://github.com/ZiyuGuo99/Point-Bind_Point-LLM)     | [Point-Bind & Point-LLM: Aligning Point Cloud with Multi-modality for 3D Understanding, Generation, and Instruction Following](https://arxiv.org/abs/2309.00615) |
| [realfusion](./scripts/realfusion/)                     | [Official](https://github.com/lukemelas/realfusion)               | [RealFusion: 360° Reconstruction of Any Object from a Single Image](https://arxiv.org/abs/2302.10663)                                                            |
| [MM-Diffusion](./scripts/MM-Diffusion/)                 | [Official](https://github.com/researchmm/MM-Diffusion)            | [MM-Diffusion: Learning Multi-Modal Diffusion Models for Joint Audio and Video Generation](https://arxiv.org/abs/2212.09478)                                     |
| [threestudio](./scripts/threestudio/)                   | [Official](https://github.com/threestudio-project/threestudio)    | [threestudio](https://github.com/threestudio-project/threestudio)                                                                                                |
| [Make-It-3D](./scripts/Make-It-3D/)                     | [Official](https://github.com/junshutang/Make-It-3D)              | [Make-It-3D: High-Fidelity 3D Creation from A Single Image with Diffusion Prior](https://arxiv.org/abs/2303.14184)                                               |
| [CoDeF](./scripts/CoDeF/)                               | [Official](https://github.com/qiuyu96/CoDeF)                      | [CoDeF: Content Deformation Fields for Temporally Consistent Video Processing](https://arxiv.org/abs/2308.07926)                                                 |
| [shap-e](./scripts/shap-e/)                             | [Official](https://github.com/openai/shap-e)                      | [Shap-E: Generating Conditional 3D Implicit Functions](https://arxiv.org/abs/2305.02463)                                                                         |
| [point-e](./scripts/point-e/)                           | [Official](https://github.com/openai/point-e)                     | [Point-E: A System for Generating 3D Point Clouds from Complex Prompts](https://arxiv.org/abs/2212.08751)                                                        |
| [One-2-3-45](./scripts/One-2-3-45)                      | [Ofiicial](https://github.com/One-2-3-45/One-2-3-45)              | [One-2-3-45: Any Single Image to 3D Mesh in 45 Seconds without Per-Shape Optimization](https://arxiv.org/abs/2306.16928)                                         |