INPUT_PROMPT=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_threestudio

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh "${INPUT_PROMPT}" "/workspace/ogiex/outputs"
mv impl/ogiex/outputs/* ${OUTPUT_PATH}