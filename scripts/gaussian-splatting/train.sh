INPUT_PATH=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_gaussian-splatting
COLMAP_CONTAINER_NAME=ogiex_colmap
PROJECT_NAME=$(basename ${INPUT_PATH})
COLMAP_IMAGES_PATH=/workspace/data_dev/${PROJECT_NAME}/images

FOLDER_EXISTS=$(docker exec $COLMAP_CONTAINER_NAME [ -d $COLMAP_IMAGES_PATH ] && echo "true" || echo "false")

if [ "$FOLDER_EXISTS" == "false" ]; then
    mkdir -p ${OUTPUT_PATH}

    # colmap
    docker exec ${COLMAP_CONTAINER_NAME} mkdir /workspace/data_dev/${PROJECT_NAME}
    docker cp ${INPUT_PATH} ${COLMAP_CONTAINER_NAME}:/workspace/data_dev/${PROJECT_NAME}/images
    docker exec ${COLMAP_CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh /workspace/data_dev/${PROJECT_NAME}
    docker cp ${COLMAP_CONTAINER_NAME}:/workspace/data_dev/${PROJECT_NAME} ${OUTPUT_PATH}

    # 3d gaussian splatting
    docker cp ${OUTPUT_PATH}/${PROJECT_NAME} ${CONTAINER_NAME}:/workspace/data_dev/
    docker exec ${CONTAINER_NAME} bash -i /workspace/scripts_in_container/demo.sh /workspace/data_dev/${PROJECT_NAME} /workspace/outputs/${PROJECT_NAME}
    docker cp ${CONTAINER_NAME}:/workspace/outputs/${PROJECT_NAME} ${OUTPUT_PATH}
else
    echo "Skip colmap and 3d gaussian splatting"
fi