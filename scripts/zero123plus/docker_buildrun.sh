IMAGE_NAME=ogiex_zero123plus
CONTAINER_NAME=ogiex_zero123plus

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/SUDO-AI-3D/zero123plus --recursive /workspace && cd /workspace && git switch -d c20ce39bda8d02b8b2db45c7905b2a87f2cf144d"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
