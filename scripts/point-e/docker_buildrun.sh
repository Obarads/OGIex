IMAGE_NAME=ogiex_point-e
CONTAINER_NAME=ogiex_point-e

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    # make impl folder
    mkdir impl

    # git clone and switch the impl. repo and copy the scripts_in_container folder
    cd impl
    git clone https://github.com/openai/point-e --recursive ./
    git switch -d fc8a607c08a3ea804cc82bf1ef8628f88a3a5d2f
    cp -r ../scripts_in_container ./

    # make input and output folders for the demo script
    mkdir -p ogiex/inputs
    mkdir -p ogiex/outputs

    # build and run the container
    cd ../
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all -v ${PWD}/impl:/workspace ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} bash /workspace/scripts_in_container/setup_package.sh
fi
