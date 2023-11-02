IMAGE_NAME=ogiex_nerfstudio
CONTAINER_NAME=ogiex_nerfstudio

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    docker start ${COLMAP_CONTAINER_NAME}
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/nerfstudio-project/nerfstudio --recursive /workspace && cd /workspace && git switch -d 85677d310fcb8700b284225de646c63bb02b83de"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
