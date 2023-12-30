INPUT_TEXT=$1
exp_root_dir=$2

cd /workspace

seed=0
gpu=0

# Stage 1
python launch.py --config configs/fourdfy_stage_1_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="${INPUT_TEXT}"

# Stage 2
ckpt=$exp_root_dir/fourdfy_stage_1_low_vram/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
python launch.py --config configs/fourdfy_stage_2_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="${INPUT_TEXT}" system.weights=$ckpt

# Stage 3
ckpt=${exp_root_dir}/fourdfy_stage_2_low_vram/a_dog_riding_a_skateboard@timestamp/ckpts/last.ckpt
python launch.py --config configs/fourdfy_stage_3_low_vram.yaml --train --gpu $gpu exp_root_dir=$exp_root_dir seed=$seed system.prompt_processor.prompt="${INPUT_TEXT}" system.weights=$ckpt
