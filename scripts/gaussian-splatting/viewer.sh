INPUT_PATH=$1

CONTAINER_NAME=ogiex_gaussian-splatting

docker cp ${INPUT_PATH} ${CONTAINER_NAME}:/workspace/outputs/
docker exec ${CONTAINER_NAME} bash -i /workspace/SIBR_viewers//bin/SIBR_gaussianViewer_app -m /workspace/outputs/$(basename ${INPUT_PATH})
