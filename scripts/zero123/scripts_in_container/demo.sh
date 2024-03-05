INPUT_PATH=$1
OUTPUT_PATH=$2

OUTPUT_PATH=$(realpath ${OUTPUT_PATH})
INPUT_PATH=$(realpath ${INPUT_PATH%/})

INPUT_BASENAME=$(basename ${INPUT_PATH})
INPUT_DIRNAME=$(dirname ${INPUT_PATH})

cd /workspace/3drec

python run_zero123.py \
    --scene ${INPUT_BASENAME} \
    --index 0 \
    --n_steps 10000 \
    --lr 0.05 \
    --sd.scale 100.0 \
    --emptiness_weight 0 \
    --depth_smooth_weight 10000. \
    --near_view_weight 10000. \
    --train_view True \
    --prefix ${OUTPUT_PATH} \
    --vox.blend_bg_texture False \
    --nerf_path ${INPUT_DIRNAME}
