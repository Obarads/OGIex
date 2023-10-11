cd /workspace

# setup python and packages
. ~/miniconda3/etc/profile.d/conda.sh
conda create -y -n gaussian-splatting python=3.9
conda activate gaussian-splatting
cd scripts_in_container
pip install -r requirements.txt

# diff-gaussian-rasterization
cd ../submodules/diff-gaussian-rasterization
pip install -e .

# simple-knn
cd ../simple-knn
pip install -e .

# add conda env
echo "conda activate gaussian-splatting" >> ~/.bashrc
