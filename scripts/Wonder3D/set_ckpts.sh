INPUT_PATH=$1

CONTAINER_NAME=ogiex_wonder3d

docker cp ${INPUT_PATH} ${CONTAINER_NAME}:/workspace/
docker exec ${CONTAINER_NAME} unzip /workspace/$(basename $INPUT_PATH) -d /workspace/
docker exec ${CONTAINER_NAME} rm /workspace/$(basename $INPUT_PATH)
