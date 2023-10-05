INPUT_PATH = $0
OUTPUT_NAME = $1

cd /workspace
# Note: If you use an image except for data dir images, please run process.py.
# background removal and recenter, save rgba at 256x256
python process.py $ --size 256

# Note: force_cuda_rast=True to avoid dr.RasterizeGLContext() error in the container.
# training gaussian stage
python main.py --config configs/image.yaml input=$INPUT_PATH save_path=$OUTPUT_NAME force_cuda_rast=True
# training mesh stage
python main2.py --config configs/image.yaml input=$INPUT_PATH save_path=$OUTPUT_NAME force_cuda_rast=True
# save 360 degree video of mesh
python -m kiui.render logs/${OUTPUT_NAME}_mesh.obj --save_video ${OUTPUT_NAME}.mp4 --force_cuda_rast --wogui

mkdir logs/${OUTPUT_NAME}

mv ${OUTPUT_NAME}_albedo.png logs/${OUTPUT_NAME}/
mv ${OUTPUT_NAME}_mesh_albedo.png logs/${OUTPUT_NAME}/
mv ${OUTPUT_NAME}_mesh.mtl logs/${OUTPUT_NAME}/
mv ${OUTPUT_NAME}_mesh.obj logs/${OUTPUT_NAME}/
mv ${OUTPUT_NAME}_model.ply logs/${OUTPUT_NAME}/
mv ${OUTPUT_NAME}.mtl logs/${OUTPUT_NAME}/
mv ${OUTPUT_NAME}.obj logs/${OUTPUT_NAME}/
