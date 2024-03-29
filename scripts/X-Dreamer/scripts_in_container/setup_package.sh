# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n x-dreamer python=3.9
conda activate x-dreamer
echo "conda activate x-dreamer" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

pip install git+https://github.com/NVlabs/nvdiffrast.git
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

# apply patch
# cd /workspace
# git apply ogiex/scripts_in_container/code.diff
