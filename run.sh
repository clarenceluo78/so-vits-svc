#!/bin/bash
#SBATCH --job-name=inference
#SBATCH --nodes=1
#SBATCH --ntasks=24
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:4
#SBATCH --partition=p-RTX2080

# resample
# python resample.py

# flist
# python preprocess_flist_config.py

# generate hubert f0
# python preprocess_hubert_f0.py

# train
python train.py -c configs/config.json -m 44k

# inference
# python inference_main.py -m "logs/44k/G_159200.pth" -c "configs/config.json" -n "Tenor-7#越过山丘_0021.wav" -t 0 -s "李健" -fmp True
# python inference_main.py -m "logs/44k/G_159200.pth" -c "configs/config.json" -n "Tenor-5#爱笑的眼睛_0033.wav" -t 0 -s "李健" -fmp True
# python inference_main.py -m "logs/44k/G_159200.pth" -c "configs/config.json" -n "Tenor-7#越过山丘_0021.wav" -t 0 -s "opencpop" -fmp True
