#!/bin/bash

set -x
set -e

FILENAME=`basename $0`
LOG="../log/$FILENAME.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time python ../src/test.py      --train_dataset_name 'all' \
                                --test_dataset_name 'all' \
                                --test_batch_size 20 \
                                --model_name 'ResNet50' \
                                --model_iter 85000 \
                                --gpu_id 1
