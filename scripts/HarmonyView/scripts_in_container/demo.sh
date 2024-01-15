# INPUT_PATH=$1
# OUTPUT_PATH=$2

# object_name="alarm backpack bell blocks chicken cream elephant grandfather grandmother hat leather lion lunch_bag mario oil school_bus1 school_bus2 shoe shoe1 shoe2 shoe3 soap sofa sorter sorting_board stucking_cups teapot toaster train turtle"
object="alarm"
SCALES1=2.0
SCALES2=1.0
NUM_SAMPLES=4

python generate.py --ckpt ckpt/syncdreamer-pretrain.ckpt --sample_num ${NUM_SAMPLES} --cfg_scales ${SCALES1} ${SCALES2} --decomposed_sampling --input gso-eval/${object}/000.png --output output_gso/${object} --elevation 30 --crop_size -1
for id in $(seq ${NUM_SAMPLES})
  do
    python train_renderer.py -i output_gso/${object}/$((id-1)).png -n ${object}-$((id-1))-neus -b configs/neus.yaml -l output_gso_renderer
done