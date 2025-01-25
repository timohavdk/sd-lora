# Создать директории /home/sddata/finetune/lora/open-image


export MODEL_NAME="stable-diffusion-v1-5/stable-diffusion-v1-5"
export OUTPUT_DIR="/home/sddata/finetune/lora/open-image"
export DATASET_NAME="Rapidata/text-2-image-Rich-Human-Feedback"

accelerate launch train_text_to_image_lora.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --dataset_name=$DATASET_NAME \
  --dataloader_num_workers=8 \
  --resolution=512 \
  --center_crop \
  --random_flip \
  --train_batch_size=4 \
  --gradient_accumulation_steps=4 \
  --max_train_steps=15000 \
  --learning_rate=1e-04 \
  --max_grad_norm=1 \
  --lr_scheduler="cosine" \
  --lr_warmup_steps=0 \
  --output_dir=${OUTPUT_DIR} \
  --report_to=wandb \
  --checkpointing_steps=50 \
  --validation_prompt="A guitar made of ice cream that melts as you play it." \
  --seed=1337 \
  --image_column="image" \
  --caption_column="prompt"