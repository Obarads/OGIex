IMAGE_NAME=ogiex_dreamgaussian
CONTAINER_NAME=ogiex_dreamgaussian

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    # docker cp scripts_in_container ogiex_dreamgaussian:/workspace/
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg CLONE_REPO=true
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/dreamgaussian/dreamgaussian.git /workspace && cd /workspace && git switch -d f787cb449edc9e7a6c4e818880c109362865ccb0"
    docker exec ogiex_dreamgaussian mkdir /workspace/data_dev/
    docker cp scripts_in_container ogiex_dreamgaussian:/workspace/
    docker exec ogiex_dreamgaussian bash /workspace/scripts_in_container/setup_package.sh
fi
