INPUT_TEXT=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_4dfy
OUTPUT_FILENAME=$(basename $OUTPUT_PATH)
OUTPUT_DIRNAME=$(dirname $OUTPUT_PATH)

mkdir -p ${OUTPUT_DIRNAME}

docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh ${INPUT_TEXT} ogiex/outputs/${OUTPUT_FILENAME}
cp impl/ogiex/outputs/${OUTPUT_FILENAME} ${OUTPUT_PATH}
