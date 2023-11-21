# INPUT_PATH=$1
OUTPUT_PATH=$1

CONTAINER_NAME=ogiex_codef

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh
docker cp ${CONTAINER_NAME}:/workspace/results/. ${OUTPUT_PATH}
docker exec ${CONTAINER_NAME} rm -rf /workspace/results
