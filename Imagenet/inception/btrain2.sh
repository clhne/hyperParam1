#!/usr/bin/env sh
set -e

OUT=inception-resnetCM9585CLR.051WD1e-7BS28_50Epochs3_1

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64

TOOLS=/gpfs/scratch/lnsmith/deepLearning/caffe/9-11-17/build/tools
#TOOLS=./build/tools

#rm -f examples/bk_imagenet/results/$OUT

$TOOLS/caffe.bin train \
     --snapshot=examples/bk_imagenet/snapshots/inception-resnetCM9585CLR.051WD1e-7BS28_50Epochs_iter_180000.solverstate  \
    --gpu=all  --solver=examples/bk_imagenet/queues/inception/bsolver2.prototxt $@ 2>&1 | tee examples/bk_imagenet/results/$OUT

exit
#     --snapshot=examples/bk_imagenet/snapshots/inception-resnetCM9585CLR.051WD1e-7BS28_100Epochs_iter_100000.solverstate  \

#     --snapshot=examples/bk_imagenet/snapshots/inception-resnetM95CLR2WD1e-7_iter_50000.solverstate  \
#    --weights=examples/bk_imagenet/snapshots/range2ndOrder_iter_15000.caffemodel  \
