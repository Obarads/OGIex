IMAGE_NAME=ogiex_realfusion
CONTAINER_NAME=ogiex_realfusion

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
    docker start ${COLMAP_CONTAINER_NAME}
else
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} /bin/bash -c "git clone https://github.com/lukemelas/realfusion --recursive /workspace && cd /workspace && git switch -d 45c55eb6a4d84b4558a14c0214d9d7abdcd0e1c3"
    docker exec ${CONTAINER_NAME} mkdir /workspace/preprocess_input_dev/
    docker exec ${CONTAINER_NAME} mkdir /workspace/preprocess_output_dev/
    docker exec ${CONTAINER_NAME} mkdir /workspace/demo_input_dev/
    docker exec ${CONTAINER_NAME} mkdir /workspace/demo_output_dev/
    docker cp scripts_in_container ${CONTAINER_NAME}:/workspace/
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
    docker exec ${CONTAINER_NAME} bash -c "cd /workspace && git apply scripts_in_container/code.diff"

    # Download demo data
    mkdir -p data
    cd data
    wget https://raw.githubusercontent.com/lukemelas/realfusion/main/examples/natural-images/bird_2/image.png
fi
