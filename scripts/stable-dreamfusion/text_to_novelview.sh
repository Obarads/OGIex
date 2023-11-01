INPUT_TEXT=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_stable-dreamfusion
OUTPUT_BASENAME=$(basename $OUTPUT_PATH)
OUTPUT_DIRNAME=$(dirname $OUTPUT_PATH)
# FILENAME_WO_EXT="${FILENAME%.*}"

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh "${INPUT_TEXT}" outputs/${OUTPUT_BASENAME}
docker cp ${CONTAINER_NAME}:/workspace/outputs/${OUTPUT_BASENAME} ${OUTPUT_DIRNAME}
