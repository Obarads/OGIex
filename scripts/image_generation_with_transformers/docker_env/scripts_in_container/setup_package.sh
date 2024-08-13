# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda activate base

# download packages (requirements.txt)
cd /tmp
pip install -r requirements.txt


cat 'export HF_HOME="/workspace/huggingface_cache"' >> ~/.bashrc