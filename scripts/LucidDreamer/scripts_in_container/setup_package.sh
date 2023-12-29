# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n luciddreamer python=3.9
conda activate luciddreamer
echo "conda activate luciddreamer" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/ogiex/scripts_in_container
pip install -r requirements.txt

# download packages (submodules)
cd /workspace/
pip install submodules/diff-gaussian-rasterization/
pip install submodules/simple-knn/
