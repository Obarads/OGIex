cd /workspace

# setup python and packages
conda create -y -n dreamgaussian python=3.9
conda activate dreamgaussian
cd dev_env
pip install -r requirements.txt

# a modified gaussain splatting (+ depth, alpha rendering)
git clone https://github.com/ashawkey/diff-gaussian-rasterization.git
cd diff-gaussian-rasterization
git switch -d 30be14209ca8d393bb75aac4c083f678ad8eae71
git submodule update --init --recursive
pip install .

# simple-knn
pip install ./simple-knn

# nvdiffrast
pip install git+https://github.com/NVlabs/nvdiffrast.git@c5caf7bdb8a2448acc491a9faa47753972edd380

# kiuikit
pip install git+https://github.com/ashawkey/kiuikit.git@1e6027afda465d45fcb4375af720b8a8176cb8df
