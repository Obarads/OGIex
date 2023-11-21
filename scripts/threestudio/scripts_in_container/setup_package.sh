cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n threestudio python=3.9
conda activate threestudio
cd scripts_in_container
pip install -r requirements.txt
pip install -r requirements-post.txt

# add conda env
echo "conda activate threestudio" >> ~/.bashrc
