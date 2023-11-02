cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n Point-Bind_Point-LLM python=3.9
conda activate Point-Bind_Point-LLM
cd scripts_in_container
pip install -r requirements.txt

# Install GPU-related packages
pip install "git+https://github.com/erikwijmans/Pointnet2_PyTorch.git@b5ceb6d9ca0467ea34beb81023f96ee82228f626#egg=pointnet2_ops&subdirectory=pointnet2_ops_lib"
pip install --upgrade https://github.com/unlimblue/KNN_CUDA/releases/download/0.2/KNN_CUDA-0.2-py3-none-any.whl

# download models
mkdir ckpts
cd ckpts
gdown https://drive.google.com/uc?id=1V9y3h9EPlPN_HzU7zeeZ6xBOcvU-Xj6h
gdown https://drive.google.com/uc?id=1BILH_aAGYuZOxvom8V9-n2fYW7nLGcai

# add conda env
echo "conda activate Point-Bind_Point-LLM" >> ~/.bashrc