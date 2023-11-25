INPUT_PATH=$1
OUTPUT_WORKSPACE=$2

cd /workspace

python main.py --workspace ${OUTPUT_WORKSPACE} --ref_path "${INPUT_PATH}" --phi_range 135 225 --iters 2000 --w 64 --h 64
python main.py --workspace ${OUTPUT_WORKSPACE} --ref_path "${INPUT_PATH}" --phi_range 135 225 --refine --w 64 --h 64
