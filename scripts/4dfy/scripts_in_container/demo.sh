# INPUT_PATH=$1
# OUTPUT_PATH=$2

seed=0
gpu=0

# Stage 1
exp_root_dir=ogiex/outputs/
python launch.py --config configs/fourdfy_stage_1_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard"

# Stage 2
ckpt=$exp_root_dir/fourdfy_stage_1_low_vram/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
python launch.py --config configs/fourdfy_stage_2_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard" system.weights=$ckpt

# Stage 3
ckpt=${exp_root_dir}/fourdfy_stage_2_low_vram/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
python launch.py --config configs/fourdfy_stage_3_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="a dog riding a skateboard" system.weights=$ckpt
