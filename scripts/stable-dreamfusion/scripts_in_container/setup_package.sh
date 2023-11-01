cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n stable-dreamfusion python=3.9
conda activate stable-dreamfusion
cd scripts_in_container
pip install -r requirements.txt

# add conda env
echo "conda activate stable-dreamfusion" >> ~/.bashrc
