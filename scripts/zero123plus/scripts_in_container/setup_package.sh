# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n zero123plus python=3.9
conda activate zero123plus
echo "conda activate zero123plus" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# apply patch
# cd /workspace
# git apply ogiex/scripts_in_container/code.diff
