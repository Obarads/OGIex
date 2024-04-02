INPUT_PATH=$1
OUTPUT_PATH=$2

INPUT_PATH=$(realpath $INPUT_PATH)
OUTPUT_PATH=$(realpath $OUTPUT_PATH)

cd /workspace

# python run.py --image $INPUT_PATH --save_dir $OUTPUT_PATH
python run.py --text $INPUT_PATH --save_dir $OUTPUT_PATH

