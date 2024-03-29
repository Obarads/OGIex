# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n threestudio python=3.9
conda activate threestudio
echo "conda activate threestudio" >> ~/.bashrc

# download packages (requirements.txt and requirements-post.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt
pip install -r requirements-post.txt
