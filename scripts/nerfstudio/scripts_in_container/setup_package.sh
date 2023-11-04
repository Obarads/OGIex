cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n nerfstudio python=3.9
conda activate nerfstudio

cd scripts_in_container
pip install -r requirements.txt
pip install git+https://github.com/NVlabs/tiny-cuda-nn.git@212104156403bd87616c1a4f73a1c5f2c2e172a9#subdirectory=bindings/torch

cd /workspace
pip install -e .

# add conda env
echo "conda activate nerfstudio" >> ~/.bashrc

# Download test data
ns-download-data nerfstudio --capture-name=poster
