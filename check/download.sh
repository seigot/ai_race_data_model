#!/bin/bash -x

#A
wget https://github.com/kenkenjlab/ai_race/releases/download/v1.1/20210114_ddqn_per_ckpt0109_trt.pth
git clone https://github.com/kenkenjlab/ai_race ai_race.kenkenjlab

#B
wget https://github.com/sahitaka/ai_race/releases/download/v1.2/0115_with_noise_trt.pth
git clone https://github.com/sahitaka/ai_race ai_race.sahitaka

#C
wget https://github.com/kenjirotorii/ai_race/blob/main/ai_race/reinforcement_learning/trt_model/dqn_20210114_trt.pth
git clone https://github.com/kenjirotorii/ai_race ai_race.kenjirotorii

#D
wget https://github.com/anchobi-no/ai_race/releases/download/296fe39/sim_race_only_good_level2_epoch.21.pth
git clone https://github.com/anchobi-no/ai_race ai_race.anchobi-no

#E
wget https://github.com/F0CACC1A/ai_race/releases/download/v2.0/20210113_simplenet_trt.pth
git clone https://github.com/F0CACC1A/ai_race ai_race.F0CACC1A

#F
wget https://github.com/k-onishi/ai_race/releases/download/v0.2/20210101_model_trt.pth
git clone https://github.com/k-onishi/ai_race ai_race.k-onishi

#G
wget https://github.com/kyad/ai_race/blob/main/ai_race/learning/scripts/20210105a-simplenet_trt_fp16.pth
git clone https://github.com/kyad/ai_race ai_race.kyad
