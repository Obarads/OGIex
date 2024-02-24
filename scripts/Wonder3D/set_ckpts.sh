INPUT_PATH=$1

CONTAINER_NAME=ogiex_wonder3d
FILENAME=$(basename ${INPUT_PATH})

mv ${INPUT_PATH} impl/${FILENAME}
docker exec ${CONTAINER_NAME} unzip /workspace/${FILENAME} -d /workspace/
