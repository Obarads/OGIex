INPUT_PATH=$1
OUTPUT_PATH=$1

CONTAINER_NAME=ogiex_zero123
INPUT_BASENAME=$(basename ${INPUT_PATH%/})

mkdir -p ${OUTPUT_PATH}

cp -r ${INPUT_PATH} impl/ogiex/inputs
docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh /workspace/ogiex/inputs/${INPUT_BASENAME} /workspace/ogiex/outputs
mv impl/ogiex/outputs/ ${OUTPUT_PATH}