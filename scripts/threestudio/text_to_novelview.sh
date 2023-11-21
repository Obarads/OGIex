INPUT_PROMPT=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_threestudio

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh "${INPUT_PROMPT}" "/workspace/dev_outputs"
docker cp ${CONTAINER_NAME}:/workspace/dev_outputs/. ${OUTPUT_PATH}
docker exec ${CONTAINER_NAME} rm -rf /workspace/dev_outputs
