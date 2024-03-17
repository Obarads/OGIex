IMAGE_NAME=ogiex/3d:11.8.0-cudnn8-devel-ubuntu22.04-torch201
CONTAINER_NAME=ogiex_triposr

if docker images --format '{{.Repository}}:{{.Tag}}' | grep -Eq "^${IMAGE_NAME}$"; then
    echo "${IMAGE_NAME} is already exist. Skip building the image.."
else
    docker build . -t ${IMAGE_NAME} -f env/Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
fi

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    # make impl folder
    mkdir impl

    # git clone and switch the impl. repo and copy the scripts_in_container folder
    cd impl
    git clone https://github.com/VAST-AI-Research/TripoSR --recursive ./
    git switch -d 00319be2f08ddd06a43edf05fbbd46b5ea1e9228

    # make input and output folders
    mkdir -p ogiex/inputs
    mkdir -p ogiex/outputs
    cp -r ../scripts_in_container ./ogiex/

    # build and run the container
    cd ../
    docker run -dit --name ${CONTAINER_NAME} --gpus all -v ${PWD}/impl:/workspace ${IMAGE_NAME}
    docker exec ${CONTAINER_NAME} bash /workspace/ogiex/scripts_in_container/setup_package.sh
fi
