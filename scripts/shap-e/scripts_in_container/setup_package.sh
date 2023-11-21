# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n shap-e python=3.9
conda activate shap-e
echo "conda activate shap-e" >> ~/.bashrc

# download packages (requirements.txt)
cd /workspace/scripts_in_container
pip install -r requirements.txt
