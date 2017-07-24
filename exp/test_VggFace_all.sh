#!/bin/bash

set -x
set -e

FILENAME=`basename $0`
LOG="../log/$FILENAME.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time python ../src/test.py --train_dataset_name 'all' \
                           --test_dataset_name  'all' \
                           --model_name 'VggFace' \
                           --model_iter 60000 \
