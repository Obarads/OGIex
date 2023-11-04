INPUT_DIR_PATH="${1%/}"
OUTPUT_DIR_PATH="${2%/}"

CONTAINER_NAME=ogiex_realfusion
INPUT_BASENAME=$(basename $INPUT_DIR_PATH)
OUTPUT_BASENAME=$(basename $OUTPUT_DIR_PATH)
OUTPUT_DIRNAME=$(dirname $OUTPUT_DIR_PATH)

mkdir -p ${OUTPUT_DIRNAME}

docker cp ${INPUT_DIR_PATH} ${CONTAINER_NAME}:/workspace/demo_input_dev/
docker exec ${CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh /workspace/demo_input_dev/${INPUT_BASENAME} /workspace/demo_output_dev/${OUTPUT_BASENAME}
docker cp ${CONTAINER_NAME}:workspace/demo_output_dev/${OUTPUT_BASENAME} ${OUTPUT_DIRNAME}
