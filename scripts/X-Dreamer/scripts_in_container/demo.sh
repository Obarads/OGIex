INPUT_PATH=$1
OUTPUT_PATH=$2

INPUT_PATH=$(realpath $INPUT_PATH)
OUTPUT_PATH=$(realpath $OUTPUT_PATH)

cd /workspace
python train_x_dreamer.py --config ${INPUT_PATH} --out-dir ${OUTPUT_PATH}
