# INPUT_PATH=$1
# OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_point-bind_point-llm
# FILENAME=$(basename $INPUT_PATH)
# OUTPUT_BASENAME=$(basename $OUTPUT_PATH)
# OUTPUT_DIRNAME=$(dirname $OUTPUT_PATH)
# FILENAME_WO_EXT="${FILENAME%.*}"

# mkdir -p ${OUTPUT_PATH}

# docker cp ${INPUT_PATH} ${CONTAINER_NAME}:/workspace/data_dev/
docker exec ${CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh # data_dev/${FILENAME} ${OUTPUT_BASENAME}
# docker cp ${CONTAINER_NAME}:/workspace/logs/${OUTPUT_BASENAME} ${OUTPUT_DIRNAME}
