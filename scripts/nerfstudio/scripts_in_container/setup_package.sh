cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n nerfstudio python=3.9
conda activate nerfstudio
cd scripts_in_container
pip install -r requirements.txt
pip install -e .

# add conda env
echo "conda activate nerfstudio" >> ~/.bashrc
