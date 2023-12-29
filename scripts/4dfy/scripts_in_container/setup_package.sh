# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n 4dfy python=3.9
conda activate 4dfy
echo "conda activate 4dfy" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# install other packages
cd /workspace
git clone https://github.com/bytedance/MVDream extern/MVDream
pip install -e extern/MVDream
