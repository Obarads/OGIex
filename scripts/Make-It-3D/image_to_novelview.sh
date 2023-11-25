INPUT_FILE_PATH=$1
OUTPUT_DIR_PATH=$2

CONTAINER_NAME=ogiex_make-it-3d
INPUT_FILENAME=$(basename $INPUT_FILE_PATH)
OUTPUT_BASENAME=$(basename $OUTPUT_DIR_PATH)
OUTPUT_DIRNAME=$(dirname $OUTPUT_DIR_PATH)
# FILENAME_WO_EXT="${INPUT_FILENAME%.*}"

mkdir -p ${OUTPUT_DIR_PATH}

cp ${INPUT_FILE_PATH} impl/ogiex/inputs/
docker exec ${CONTAINER_NAME} bash -i /workspace/ogiex/scripts_in_container/demo.sh ogiex/inputs/${INPUT_FILENAME} ogiex/outputs/
mv impl/results/ogiex/outputs/* ${OUTPUT_DIR_PATH}
