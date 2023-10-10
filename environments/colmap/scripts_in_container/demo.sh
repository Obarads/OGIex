DATASET_PATH=$1

colmap automatic_reconstructor \
    --workspace_path $DATASET_PATH \
    --image_path $DATASET_PATH/images \
    --camera_model SIMPLE_PINHOLE