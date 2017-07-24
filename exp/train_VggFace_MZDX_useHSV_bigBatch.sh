#!/bin/bash

set -x
set -e

FILENAME=`basename $0`
LOG="../log/$FILENAME.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time python ../src/train.py --train_dataset_name 'MZDX_HSV' \
                            --model_name 'VggFace' \
                            --train_batch_size 50
