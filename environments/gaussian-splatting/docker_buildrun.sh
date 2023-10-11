IMAGE_NAME=ogiex_gaussian-splatting
CONTAINER_NAME=ogiex_gaussian-splatting

COLMAP_IMAGE_NAME=ogiex_colmap
COLMAP_CONTAINER_NAME=ogiex_colmap

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    docker start ${COLMAP_CONTAINER_NAME}
else
    # gaussian-splatting
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/graphdeco-inria/gaussian-splatting --recursive /workspace && cd /workspace && git switch -d ea68bdf29c3b11d1a7ec2e5a11b1af2c266bd7f2"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh

    # colmap
    docker build . -t ${COLMAP_IMAGE_NAME} -f ../colmap/Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${COLMAP_CONTAINER_NAME} --gpus all ${COLMAP_IMAGE_NAME}
    docker cp ../colmap/scripts_in_container ${COLMAP_CONTAINER_NAME}:/workspace/
fi
