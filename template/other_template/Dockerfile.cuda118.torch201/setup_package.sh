# load conda shell
. ~/miniconda3/etc/profile.d/conda.sh

# download packages (requirements.txt)
cd /tmp/Dockerfile.cuda118.torch201/
pip install -r requirements.txt
pip install -r requirements-post.txt
