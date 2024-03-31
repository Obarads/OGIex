IMAGE_NAME=@{image_name@}
CONTAINER_NAME=ogiex_@{container_name@}

if docker images --format '{{.Repository}}:{{.Tag}}' | grep -Eq "^${IMAGE_NAME}$"; then
    echo "${IMAGE_NAME} is already exist. Skip building the image.."
else
    cd docker_env
    docker build . -t ${IMAGE_NAME} -f Dockerfile --build-arg UID=$(id -u) --build-arg GID=$(id -g)
    cd ..
fi

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    docker start ${CONTAINER_NAME}
else
    # make impl folder
    mkdir impl

    # git clone and switch the impl. repo and copy the scripts_in_container folder
    cd impl
    git clone @{github_url@} --recursive ./
    git switch -d @{github_commit_hash@}

    # make input and output folders
    mkdir -p ogiex/inputs
    mkdir -p ogiex/outputs
    cp -r ../scripts_in_container ./ogiex/

    # build and run the container
    cd ../
    docker run -dit --name ${CONTAINER_NAME} --gpus all -v ${PWD}/impl:/workspace ${IMAGE_NAME}
    # docker exec ${CONTAINER_NAME} bash /workspace/ogiex/scripts_in_container/setup_package.sh
fi
