INPUT_CONFIG_PATH=$1
OUTPUT_FOLDER_PATH=$2

cd /workspace
export CUDA_VISIBLE_DEVICES="0"
python train.py --opt "${INPUT_CONFIG_PATH}" --output_folder_path "${OUTPUT_FOLDER_PATH}" 
