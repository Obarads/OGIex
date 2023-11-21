INPUT_PROMPT=$1
OUTPUT_PATH=$2

cd /workspace/
mkdir -p ${OUTPUT_PATH}

python launch.py --config configs/dreamfusion-sd.yaml --train --gpu 0 system.prompt_processor.prompt="${INPUT_PROMPT}" exp_root_dir="${OUTPUT_PATH}"
