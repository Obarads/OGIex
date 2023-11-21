INPUT_PATH=$1
OUTPUT_PATH=$2

cd /workspace/
python scripts_in_container/image_to_point_image.py --input_file_path $INPUT_PATH --output_file_path $OUTPUT_PATH
