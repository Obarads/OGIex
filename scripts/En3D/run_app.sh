CONTAINER_NAME=ogiex_en3d

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -c "cd /workspace && bash -i /workspace/ogiex/scripts_in_container/demo.sh"