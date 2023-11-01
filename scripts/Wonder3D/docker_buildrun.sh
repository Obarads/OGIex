IMAGE_NAME=ogiex_wonder3d
CONTAINER_NAME=ogiex_wonder3d

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/xxlong0/Wonder3D --recursive /workspace && cd /workspace && git switch -d a13e09cf6955117cd330a8beb1c2ea771e62754d"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
