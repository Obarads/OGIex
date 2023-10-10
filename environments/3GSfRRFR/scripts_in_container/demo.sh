INPUT_PATH=$1
OUTPUT_PATH=$2

cd /workspace
python train.py -s ${INPUT_PATH} -m ${OUTPUT_PATH}
