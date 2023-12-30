# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n 4dfy python=3.9
conda activate 4dfy
echo "conda activate 4dfy" >> ~/.bashrc

# download packages (requirements.txt and other)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt
pip install git+https://github.com/KAIR-BAIR/nerfacc.git@v0.5.2
pip install git+https://github.com/NVlabs/tiny-cuda-nn.git@212104156403bd87616c1a4f73a1c5f2c2e172a9#subdirectory=bindings/torch
pip install git+https://github.com/NVlabs/nvdiffrast.git

# install other packages
cd /workspace
git clone https://github.com/bytedance/MVDream extern/MVDream
pip install -e extern/MVDream
