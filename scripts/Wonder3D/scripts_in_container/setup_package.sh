# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n wonder3d python=3.8
conda activate wonder3d
echo "conda activate wonder3d" >> ~/.bashrc

# download packages (requirements.txt and other packages)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

# download SAM
cd /workspace
mkdir sam_pt
cd sam_pt
wget https://huggingface.co/spaces/abhishek/StableSAM/resolve/main/sam_vit_h_4b8939.pth

# apply patch
cd /workspace
git apply ogiex/scripts_in_container/code.diff
