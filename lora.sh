export SAMPLE_PROMPT="/home/ec2-user/dev/tazo/configs/prompt.txt"
export CONFIG_FILE="/home/ec2-user/dev/tazo/configs/config.toml"
export DATASET_CONFIG="/home/ec2-user/dev/tazo/configs/dataset.toml"


if [ ! -f $SAMPLE_PROMPT ]; then
  echo "sample prompt not found"
  exit 1
fi

if [ ! -f $CONFIG_FILE ]; then
  echo "config file not found"
  exit 1
fi

if [ ! -f $DATASET_CONFIG ]; then
  echo "dataset config not found"
  exit 1
fi

accelerate launch \
  --num_cpu_threads_per_process=1 \
  train_network.py \
  --sample_prompts=$SAMPLE_PROMPT \
  --dataset_config=$DATASET_CONFIG \
  --config_file=$CONFIG_FILE