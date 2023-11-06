IMAGE_NAME=ogiex_make-it-3d
CONTAINER_NAME=ogiex_make-it-3d

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    docker start ${COLMAP_CONTAINER_NAME}
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/junshutang/Make-It-3D --recursive /workspace && cd /workspace && git switch -d 659c7bc57c55f1d768a303c05ae115cc6d5bfb65"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker exec ${CONTAINER_NAME} mkdir /workspace/output_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
