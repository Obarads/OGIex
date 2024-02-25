# INPUT_PATH=$1
OUTPUT_PATH=$1

CONTAINER_NAME=ogiex_zero123plus

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh
mv impl/output.png ${OUTPUT_PATH}
