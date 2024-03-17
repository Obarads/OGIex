INPUT_PATH=$1
OUTPUT_PATH=$2

INPUT_PATH=$(realpath $INPUT_PATH)
OUTPUT_PATH=$(realpath $OUTPUT_PATH)

cd /workspace/
python run.py ${INPUT_PATH} --output-dir ${OUTPUT_PATH}
