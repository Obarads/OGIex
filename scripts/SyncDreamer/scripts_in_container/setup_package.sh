# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n syncdreamer python=3.9
conda activate syncdreamer
echo "conda activate syncdreamer" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# Download git packages
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
pip install git+https://github.com/openai/CLIP.git

# apply patch
# cd /workspace
# git apply ogiex/scripts_in_container/code.diff
