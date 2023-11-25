INPUT_FILE_PATH=$1
OUTPUT_DIR_PATH=$2

CONTAINER_NAME=ogiex_one-2-3-45
INPUT_FILENAME=$(basename $INPUT_FILE_PATH)

mkdir -p ${OUTPUT_DIR_PATH}

cp ${INPUT_FILE_PATH} impl/ogiex/inputs/
docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh ogiex/inputs/${INPUT_FILENAME} ogiex/outputs/
cp -r impl/ogiex/outputs/* ${OUTPUT_DIR_PATH}
rm -rf impl/ogiex/outputs/*
