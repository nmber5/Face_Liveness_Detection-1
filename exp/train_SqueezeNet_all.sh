#!/bin/bash

set -x
set -e

FILENAME=`basename $0`
LOG="../log/$FILENAME.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time python ../src/train.py     --load_size 256 \
                                --crop_size 227 \
                                --base_lr 5e-6 \
                                --lr_policy 'step'\
                                --stepsize 3000 \
                                --train_batch_size 128 \
                                --val_batch_size 128\
                                --test_interval 200 \
                                --num_epoch 5\
                                --train_dataset_name 'all' \
                                --model_name 'SqueezeNet' \
                                --gpu_id 5
