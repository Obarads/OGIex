# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n harmonyview python=3.8
conda activate harmonyview
echo "conda activate harmonyview" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# apply patch
# cd /workspace
# git apply ogiex/scripts_in_container/code.diff

pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
pip install git+https://github.com/openai/CLIP.git

git clone https://github.com/NVlabs/nvdiffrast.git
cd nvdiffrast/
pip install -e .


# download ckpt
cd /workspace
mkdir ckpt
cd ckpt
gdown https://drive.google.com/uc?id=1t5rRpwBr7uzoQFi8ntgWD1ktXxVanEMZ
gdown https://drive.google.com/uc?id=1QqCCSfJQPEoCUBpagV1109xwplaztLxk

# download samples
# cd /workspace
# gdown https://drive.google.com/drive/folders/1YVdX7IHXCaF0PIQsvSyvgNrw-nojUumD -O ./ --folder
# gdown https://drive.google.com/drive/folders/1FoB4dy_fqBMq_v4cFDPd2Q3ds3rzPQI8 -O ./ --folder

# download output_gso
cd /workspace
mkdir output_gso
cd output_gso
gdown https://drive.google.com/drive/folders/1dk5DtkkTD8z7x0n2mGPGVTnOtcyXP8ES -O ./ --folder

# download output_gso_renderer
cd /workspace
mkdir output_gso_renderer
cd output_gso_renderer
gdown https://drive.google.com/drive/folders/1UdBHHA4BN9V_Zg8BEwXAPayielHhbO7D -O ./ --folder
gdown https://drive.google.com/drive/folders/10DlJILTIiR1Q687iYdf9Q5tf6xVvJD-F -O ./ --folder
gdown https://drive.google.com/drive/folders/1ydBfDHpZx7a94KiX1H8ctdEFE1UXzWBA -O ./ --folder
gdown https://drive.google.com/drive/folders/1N29HcybVuclBtFlk5OIbF-9UdTouMrAV -O ./ --folder
