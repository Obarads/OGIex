# Text2Room: Extracting Textured 3D Meshes from 2D Text-to-Image Models

Update: 2023/07/26

## ℹ️ Info
- Paper: [arxiv.org](https://arxiv.org/abs/2303.11989)
  - Submission date: 2023/03/21
  - Authors: Lukas Höllein, Ang Cao, Andrew Owens, Justin Johnson, Matthias Nießner
  - Conf.: ICCV 2023
- Implementation: [lukasHoel/text2room](https://github.com/lukasHoel/text2room)
  - framework: Pytorch
  - Official code: Yes
  - License: MIT license
- Keywords: CV, Mesh, RGB Image, Intensity Image, Scene Generation

## 🖥️ Setup commands to run the implementation
- Test env.: GPU: RTX4090, RTX2080Ti

### 1. Clone the repository and move to the directory
```bash
git clone https://github.com/Obarads/OGIex.git
cd OGIex/scripts/text2room
```

### 2. Run the implementation 
Please refer to `OGIex/scripts/text2room/README.md` (or the [README.md on Github](https://github.com/Obarads/OGIex/tree/main/scripts/text2room/README.md)).

## 📝 Clipping and note
### Introduction
- The authors present Text2Room, a method for generating textured 3D meshes of room-scale indoor scenes from a given text prompt as input.
- > In very recent concurrent work, Fridman et al. [18] create 3D scenes from text,  but  focus  on  this  type  of  3D-consistent “zoom-out” video generation. 
  - > Instead, we generate complete, textured 3D room geometry from arbitrary trajectories.
- > We visualize this workflow in Figure 2.

![fig2](img/TET3Mf2TM/fig2.png)

> Figure 2. Method overview.  We iteratively create a textured 3D mesh in two stages.  (a) First, we sample predefined poses and text to generate the complete scene layout and furniture. Each new pose (marked in green) adds newly generated geometry to the mesh (depicted by green triangles) in an iterative scene generation scheme (see Figure 3 for details).  Blue poses/triangles denote viewpoints that created geometry in a previous iteration.  (b) Second, we fill in the remaining unobserved regions by sampling additional poses (marked in red) after the scene layout is defined.

![fig3](img/TET3Mf2TM/fig3.png)

> Figure 3. Iterative scene generation. For each new pose, we render the current mesh to obtain partial RGB and depth renderings. We complete both, utilizing respective inpainting models and the text prompt.  Next, we perform depth alignment (see Section 3.2) and mesh filtering (see Section 3.3) to obtain an optimal next mesh patch, that is finally fused with the existing geometry.

### Contributions, novelty
> To summarize, our contributions are: 
> - Generating 3D meshes of room-scale indoor scenes with compelling textures and geometry from any text input. 
> - A method that leverages 2D text-to-image models and monocular depth estimation to lift frames into 3D in an iterative scene generation. Our proposed depth alignment and mesh fusion steps, enable us to create seamless and undistorted geometry and textures. 
> - A two-stage tailored viewpoint selection that samples camera poses from optimal positions to first create the room layout and furniture and then close any remaining holes, creating a watertight mesh

### どうやって有効だと検証した?
- > We  calculate CLIP Score (CS) [57] and Inception Score (IS) [68] on RGB renderings of the respective scenes.
- Qualitative Results (figure 6)
- Quantitative Results (table 1)

![fig6](img/TET3Mf2TM/fig6.png)
> Figure 5. 3D scene generation results of our method. We show color and shaded geometry renderings from generated scenes with corresponding text prompts. Our method synthesizes realistic meshes satisfying text descriptions. We remove the ceiling in the top-down view for better visualization of the scene layout.

![tab1](img/TET3Mf2TM/tab1.png)
> Table  1. Quantitative  comparison. We  report  2D  metrics and  user  study  results,  including:   Clip  Score  (CS),  Inception Score (IS), Perceptual Quality (PQ), and 3D Structure Completeness  (3DS). Our method creates scenes with the highest quality.

### Other experiments
Ablations, Application: Controllable Scene Generation, Limitations, Additional Discussion on Related Methods and Baselines, Additional Qualitative Results

## 📚 References
- [18] Rafail Fridman, Amit Abecasis, Yoni Kasten, and Tali Dekel. Scenescape:  Text-driven consistent scene generation. arXiv preprint arXiv:2302.01133, 2023.
- [57] Alec  Radford,   Jong  Wook  Kim,   Chris  Hallacy,   Aditya Ramesh,  Gabriel  Goh,  Sandhini  Agarwal,  Girish  Sastry, Amanda Askell, Pamela Mishkin, Jack Clark, et al. Learning transferable  visual  models  from  natural  language  supervision. In International conference on machine learning, pages 8748–8763. PMLR, 2021.
- [68] Tim  Salimans,  Ian  Goodfellow,  Wojciech  Zaremba,  Vicki Cheung, Alec Radford, and Xi Chen.  Improved techniques for training gans. Advances in neural information processing systems, 29, 2016.
