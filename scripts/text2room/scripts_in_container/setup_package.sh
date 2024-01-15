# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n text2room python=3.9
conda activate text2room
echo "conda activate text2room" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt
pip install "git+https://github.com/facebookresearch/pytorch3d.git@v0.7.2"

# apply patch
# cd /workspace
# git apply ogiex/scripts_in_container/code.diff

# Download models
cd /workspace
mkdir checkpoints
gdown https://drive.google.com/uc?id=1mMvj0fBKPfXRjLypaDPrCidT67jutWdr -O checkpoints/
gdown https://drive.google.com/uc?id=16cNJPZgxHI2wsa5dlG1HgMD_Vl5BPTSq -O checkpoints/
