INPUT_PATH=$1
OUTPUT_PATH=$2

cd /workspace/
python scripts_in_container/image_to_novelview.py --input_file_path $INPUT_PATH --output_gif_file_path $OUTPUT_PATH
