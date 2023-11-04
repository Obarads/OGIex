INPUT_FILE_PATH="${1%/}"
OUTPUT_DIR_PATH="${2%/}"

CONTAINER_NAME=ogiex_realfusion
INPUT_DIR_PATH=$(dirname $INPUT_FILE_PATH)
INPUT_FILENAME=$(basename $INPUT_FILE_PATH)
OUTPUT_DIRNAME_PATH=$(dirname $OUTPUT_DIR_PATH)

mkdir -p ${OUTPUT_DIRNAME_PATH}

docker cp ${INPUT_FILE_PATH} ${CONTAINER_NAME}:/workspace/preprocess_input_dev/
docker exec ${CONTAINER_NAME} bash -i -c "cd /workspace && python scripts/extract-mask.py --image_path /workspace/preprocess_input_dev/${INPUT_FILENAME} --output_dir /workspace/preprocess_output_dev/${INPUT_FILENAME}"
docker cp -L ${CONTAINER_NAME}:/workspace/preprocess_output_dev/${INPUT_FILENAME}/ ${OUTPUT_DIR_PATH}
