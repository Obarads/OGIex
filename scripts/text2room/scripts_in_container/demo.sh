INPUT_CONFIG_FILE_PATH=$1
OUTPUT_PATH=$2

cd /workspace
python generate_scene.py --trajectory_file=${INPUT_CONFIG_FILE_PATH} --out_path=${OUTPUT_PATH}
