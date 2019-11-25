#!/bin/bash

echo train lightcnn

gpu_ids='0'
workers=8
epochs=15
pre_epoch=0
batch_size=128
lr=0.001

print_freq=20

num_classes=725
weights='./pre_train/LightCNN_29Layers_V2_checkpoint.pth.tar'
img_root='/data1/chaoyou.fu/HFR_Datasets/CASIA_NIR_VIS_align3'
train_list='/data1/chaoyou.fu/HFR_Datasets/CASIA_NIR_VIS_align3/list_file/train_list_1_revised_flag.txt'

fake_path='./fake_images'
fake_num=100000

python train_lightcnn.py --gpu_ids $gpu_ids --workers $workers --epochs $epochs --batch_size $batch_size --lr $lr \
                         --print_freq $print_freq --weights $weights --img_root $img_root --train_list $train_list \
                         --num_classes $num_classes --fake_path $fake_path --fake_num $fake_num | tee train_lightcnn.log
