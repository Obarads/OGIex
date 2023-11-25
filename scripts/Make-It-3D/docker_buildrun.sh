IMAGE_NAME=ogiex_make-it-3d
CONTAINER_NAME=ogiex_make-it-3d

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    # make impl folder
    mkdir impl

    # git clone and switch the impl. repo and copy the scripts_in_container folder
    cd impl
    git clone https://github.com/junshutang/Make-It-3D --recursive ./
    git switch -d 659c7bc57c55f1d768a303c05ae115cc6d5bfb65
    cp -r ../scripts_in_container ./ogiex

    # make input and output folders for the demo script
    mkdir -p ogiex/inputs
    mkdir -p ogiex/outputs

    # build and run the container
    cd ../
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    docker run -dit --name ${CONTAINER_NAME} --gpus all -v ${PWD}/impl:/workspace ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} bash /workspace/ogiex/scripts_in_container/setup_package.sh
fi
