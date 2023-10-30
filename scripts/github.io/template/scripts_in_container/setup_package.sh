cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n @{github_dir_lowercase@} python=3.9
conda activate @{github_dir_lowercase@}
cd scripts_in_container
pip install -r requirements.txt

# add conda env
echo "conda activate @{github_dir_lowercase@}" >> ~/.bashrc

