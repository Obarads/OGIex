cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n wonder3d python=3.9
conda activate wonder3d
cd scripts_in_container
pip install -r requirements.txt
pip install git+https://github.com/NVlabs/tiny-cuda-nn.git@212104156403bd87616c1a4f73a1c5f2c2e172a9#subdirectory=bindings/torch

# add conda env
echo "conda activate wonder3d" >> ~/.bashrc

