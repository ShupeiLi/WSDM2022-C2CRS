#! /usr/bin
CUDA_VISIBLE_DEVICES=0
python run_crslab.py \
    -c config/crs/c2crs/tgredial.yaml \
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
    --coarse_pretrain_epoch 0 \
    --pretrain_epoch 0 \
    --rec_epoch 0 \
    --conv_epoch 0  \
    --nb_review 4  \
    -rs \
    --restore_path rec-train \
    --model_file_for_restore C2CRS_Model_0.pth \
    --freeze_parameters_name k_c  \
    --freeze_parameters \
    --logit_type hs_copy2 \
    --is_coarse_weight_loss \
    --token_freq_th 1500 \
    --coarse_weight_th 0.1
