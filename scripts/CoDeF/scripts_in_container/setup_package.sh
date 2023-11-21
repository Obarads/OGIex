# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n codef python=3.10
conda activate codef
echo "conda activate codef" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/scripts_in_container
pip install -r requirements.txt

# setup tiny-cuda-nn python package
cd /workspace
git clone --recursive https://github.com/nvlabs/tiny-cuda-nn
git switch -d 6f018a9cd1b369bcb247e1d539968db8e48b2b3f
cd tiny-cuda-nn 
cmake . -B build
cmake --build build --config RelWithDebInfo -j
cd bindings/torch
python setup.py install

# download a dataset
cd /workspace
gdown https://drive.google.com/uc?id=1cKZF6ILeokCjsSAGBmummcQh0uRGaC_F
unzip all_sequences.zip

# download pretrained model
cd /workspace
mkdir -p ckpts/all_sequences/scene_0/base/
cd ckpts/all_sequences/scene_0/base/
gdown https://drive.google.com/uc?id=1abOdREarfw1DGscahOJd2gZf1Xn_zN-F
