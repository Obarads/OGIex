INPUT_DIR_PATH=$1
OUTPUT_DIR_PATH=$2

cd /workspace/textual-inversion
export MODEL_NAME="runwayml/stable-diffusion-v1-5"
python textual_inversion.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$INPUT_DIR_PATH \
  --learnable_property="object" \
  --placeholder_token="_cat_statue_" \
  --initializer_token="cat" \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=4 \
  --max_train_steps=3000 \
  --learning_rate=5.0e-04 --scale_lr \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --output_dir=$OUTPUT_DIR_PATH \
  --use_augmentations

