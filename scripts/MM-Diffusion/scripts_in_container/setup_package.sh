cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n mmdiffusion python=3.8
conda activate mmdiffusion
conda install mpi4py
pip install -r scripts_in_container/requirements.txt

# download dataset
gdown https://drive.google.com/drive/folders/14A1zaQI5EfShlv3QirgCGeNFzZBzQ3lq -O ./ --folder

# download pretrained model
mkdir -p data10/rld/outputs/MM-Diffusion/
gdown https://drive.google.com/drive/folders/1Mno4A3BUXELAdX4m650CJ1VfuMVlkz5p -O ./ --folder
mv checkpoints data10/rld/outputs/MM-Diffusion/models

# add conda env
echo "conda activate mmdiffusion" >> ~/.bashrc

# mv script
mv scripts_in_container/multimodal_sample_sr_safe.sh ssh_scripts/
