INPUT_PATH=$1
OUTPUT_PATH=$2

OUTPUT_PATH=$(realpath ${OUTPUT_PATH})
FILENAME=$(basename "$INPUT_PATH")
FILENAME_WO_EXT="${FILENAME%.*}"
DIRNAME=$(dirname "$INPUT_PATH")

cd /workspace
accelerate launch --config_file 1gpu.yaml test_mvdiffusion_seq.py \
            --config configs/mvdiffusion-joint-ortho-6views.yaml validation_dataset.root_dir=${DIRNAME} \
            validation_dataset.filepaths=["${FILENAME}"] save_dir=${OUTPUT_PATH}

cd /workspace/instant-nsr-pl
python launch.py --config configs/neuralangelo-ortho-wmask.yaml --gpu 0 --train dataset.root_dir=${OUTPUT_PATH}/cropsize-192-cfg1.0/ dataset.scene="${FILENAME_WO_EXT}"
