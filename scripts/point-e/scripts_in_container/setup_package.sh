# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n point-e python=3.9
conda activate point-e
echo "conda activate point-e" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/scripts_in_container
pip install -r requirements.txt

# download point-e
cd /workspace
pip install -e .