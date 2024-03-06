IMAGE_NAME=ogiex_x-dreamer
CONTAINER_NAME=ogiex_x-dreamer

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    # make impl folder
    mkdir impl

    # git clone and switch the impl. repo and copy the scripts_in_container folder
    cd impl
    git clone https://github.com/xmu-xiaoma666/X-Dreamer --recursive ./
    git switch -d 93dbfdb372755f47027c79e4e89129d2f3c60d5e

    # make input and output folders
    mkdir -p ogiex/inputs
    mkdir -p ogiex/outputs
    cp -r ../scripts_in_container ./ogiex/

    # build and run the container
    cd ../
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all -v ${PWD}/impl:/workspace ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} bash /workspace/ogiex/scripts_in_container/setup_package.sh
fi
