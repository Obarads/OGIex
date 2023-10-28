IMAGE_NAME=ogiex_mmdiffusion
CONTAINER_NAME=ogiex_mmdiffusion

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    # docker cp scripts_in_container ogiex_dreamgaussian:/workspace/
else
    # docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/researchmm/MM-Diffusion.git /workspace && cd /workspace && git switch -d c895b2993c471dd93fe4411f46af6c46c6eed4af"
    docker exec ${CONTAINER_NAME} mkdir /workspace/data_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
