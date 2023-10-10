INPUT_PATH=$1
OUTPUT_PATH=$2

INPUT_DIR_PATH=$(dirname $INPUT_PATH)
INPUT_FILENAME=$(basename $INPUT_PATH)
FILENAME_WO_EXT="${INPUT_FILENAME%.*}"

mkdir -p $OUTPUT_PATH

docker cp ${INPUT_PATH} ogiex_dreamgaussian:/workspace/data_dev/
docker exec ogiex_dreamgaussian bash -i -c "cd /workspace && python process.py /workspace/data_dev/${INPUT_FILENAME} --size 256"
docker cp ogiex_dreamgaussian:/workspace/data_dev/${FILENAME_WO_EXT}_rgba.png ${OUTPUT_PATH}
