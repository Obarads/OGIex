# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n @{github_dir_lowercase@} python=3.9
conda activate @{github_dir_lowercase@}
echo "conda activate @{github_dir_lowercase@}" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/scripts_in_container
pip install -r requirements.txt
