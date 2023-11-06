# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n make-it-3d python=3.9
conda activate make-it-3d
echo "conda activate make-it-3d" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/scripts_in_container
pip install -r requirements.txt
pip install -r requirements-post.txt

# download a package with diff file
cd /workspace
git clone https://github.com/S-aiueo32/contextual_loss_pytorch.git
cd contextual_loss_pytorch
git apply ../scripts_in_container/code.diff

# download dependencies in Make-It-3D
cd /workspace
pip install ./raymarching

# Training requirements
cd /workspace
git clone https://github.com/isl-org/DPT.git
mkdir dpt_weights
