INPUT_PATH=$1
OUTPUT_PATH=$2

cd /workspace
python -m ogiex.scripts_in_container.image_to_novelview --input_file_path $INPUT_PATH --output_dir_path $OUTPUT_PATH
