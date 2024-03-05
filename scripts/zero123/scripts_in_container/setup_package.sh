# load conda shell
cd /workspace
. ~/miniconda3/etc/profile.d/conda.sh

# setup python and packages
cd /workspace
conda create -y -n zero123 python=3.9
conda activate zero123
echo "conda activate zero123" >> ~/.bashrc

# apply patch
cd /workspace
git apply ogiex/scripts_in_container/code.diff

# download packages (requirements.txt and other)
cd /workspace/zero123/
pip install -r requirements.txt
git clone https://github.com/CompVis/taming-transformers.git
pip install -e taming-transformers/
git clone https://github.com/openai/CLIP.git
pip install -e CLIP/

cd /workspace/3drec/
pip install -r requirements.txt

# https://huggingface.co/cvlab/zero123-weights/tree/main
cd /workspace/zero123/
# iteration=300000
iteration=105000
wget https://cv.cs.columbia.edu/zero123/assets/${iteration}.ckpt
