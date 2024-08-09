INPUT_TEXT=$1
OUTPUT_PATH=$2

CONTAINER_NAME=ogiex_transformers

mkdir -p ${OUTPUT_PATH}

docker exec ${CONTAINER_NAME} bash -c "cd /workspace && bash -i /workspace/ogiex/scripts_in_container/demo.sh "${INPUT_TEXT}" /workspace/ogiex/outputs"
mv impl/ogiex/outputs/* ${OUTPUT_PATH}
