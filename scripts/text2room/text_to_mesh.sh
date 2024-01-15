INPUT_CONFIG_FILE_PATH=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_text2room
INPUT_CONFIG_FILENAME=$(basename $INPUT_CONFIG_FILE_PATH)
OUTPUT_FILENAME=$(basename $OUTPUT_PATH)
OUTPUT_DIRNAME=$(dirname $OUTPUT_PATH)

mkdir -p ${OUTPUT_PATH}

cp ${INPUT_CONFIG_FILE_PATH} impl/ogiex/inputs/
docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh ogiex/inputs/${INPUT_CONFIG_FILENAME} ogiex/outputs
mv impl/ogiex/outputs/* ${OUTPUT_PATH}
