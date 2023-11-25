# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n one-2-3-45 python=3.9
conda activate one-2-3-45
echo "conda activate one-2-3-45" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# download pre-trained model
cd /workspace
python download_ckpt.py
