# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n realfusion python=3.9
conda activate realfusion
echo "conda activate realfusion" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/scripts_in_container
pip install -r requirements.txt

# install raymarching, shencoder, freqencoder, gridencoder, nvdiffrast
cd /workspace
pip install ./raymarching
pip install ./shencoder
pip install ./freqencoder
pip install ./gridencoder
pip install git+https://github.com/NVlabs/nvdiffrast.git@c5caf7bdb8a2448acc491a9faa47753972edd380
