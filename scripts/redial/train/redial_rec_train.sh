#! /usr/bin
CUDA_VISIBLE_DEVICES=0 
python run_crslab.py \
    -c config/crs/c2crs/redial.yaml \
    -g 0 \
    -ss \
    -ct 256 \
    -it 100 \
    --scale 1.0 \
    -pbs 256 \
    -rbs 256  \
    -cbs 256 \
    --info_truncate 40  \
    --coarse_loss_lambda 0.2 \
    --fine_loss_lambda 1.0 \
    --coarse_pretrain_epoch 12 \
    --pretrain_epoch 25 \
    --rec_epoch 50 \
    --conv_epoch 0
