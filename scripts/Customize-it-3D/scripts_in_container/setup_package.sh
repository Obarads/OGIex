# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n customize-it-3d python=3.9
conda activate customize-it-3d
echo "conda activate customize-it-3d" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# pip git packages
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
pip install git+https://github.com/facebookresearch/pytorch3d.git
pip install git+https://github.com/S-aiueo32/contextual_loss_pytorch.git@4585061   
pip install ./raymarching
pip install git+https://github.com/facebookresearch/segment-anything.git

# apply patch
# cd /workspace
# git apply ogiex/scripts_in_container/code.diff
