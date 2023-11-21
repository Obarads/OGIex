INPUT_PATH=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_one-2-3-45
INPUT_FILENAME=$(basename $INPUT_PATH)
OUTPUT_FILENAME=$(basename $OUTPUT_PATH)
OUTPUT_DIRNAME=$(dirname $OUTPUT_PATH)

mkdir -p ${OUTPUT_DIRNAME}

cp ${INPUT_PATH} impl/ogiex/inputs/
docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh ogiex/inputs/${INPUT_FILENAME} ogiex/outputs/${OUTPUT_FILENAME}
cp impl/ogiex/outputs/${OUTPUT_FILENAME} ${OUTPUT_PATH}

