INPUT_TEXT=$1
OUTPUT_NAME=$2

cd /workspace
python main.py --text "${INPUT_TEXT}" --workspace ${OUTPUT_NAME} -O
# CUDA_VISIBLE_DEVICES=0 python main.py --text ${INPUT_TEXT} --workspace ${OUTPUT_NAME} -O
