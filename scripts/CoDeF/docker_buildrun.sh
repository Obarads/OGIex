IMAGE_NAME=ogiex_codef
CONTAINER_NAME=ogiex_codef

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    docker start ${COLMAP_CONTAINER_NAME}
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all --shm-size=48g ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/qiuyu96/CoDeF --recursive /workspace && cd /workspace && git switch -d 743aec5e1849220b0efa3b657774b4321101ccb7"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker exec ${CONTAINER_NAME} mkdir /workspace/output_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
