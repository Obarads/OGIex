cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n zero123plus python=3.9
conda activate zero123plus
cd scripts_in_container
pip install -r requirements.txt

# add conda env
echo "conda activate zero123plus" >> ~/.bashrc

