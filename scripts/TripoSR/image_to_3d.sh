INPUT_PATH=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_triposr
FILENAME=$(basename $INPUT_PATH)

mkdir -p ${OUTPUT_PATH}

cp ${INPUT_PATH} impl/ogiex/inputs/
docker exec ${CONTAINER_NAME} bash -c "cd /workspace && bash -i /workspace/ogiex/scripts_in_container/demo.sh /workspace/ogiex/inputs/${FILENAME} /workspace/ogiex/outputs"
mv impl/ogiex/outputs/* ${OUTPUT_PATH}
