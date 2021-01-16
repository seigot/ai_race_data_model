# 動作確認用

ダウンロードスクリプト

```
bash download.sh
```

以下は確認用の一覧表

|  -  |  ダウンロード方法(コマンド)  |  ■ 動かし方  |  備考  |
| ---- | ---- | ---- | ---- |
|  A  |  wget https://github.com/kenkenjlab/ai_race/releases/download/v1.1/20210114_ddqn_per_ckpt0109_trt.pth  |  python inference_from_image.py --trt_module --trt_model 20210114_ddqn_per_ckpt0109_trt.pth  |  デフォルトのinference_from_image.pyでよさそう  |
|  B  |  wget https://github.com/sahitaka/ai_race/releases/download/v1.2/0115_with_noise_trt.pth  |  "cd ~/catkin_ws/src/ai_race/learning/scripts python inference_from_image.py --trt_module --trt_model 0115_with_noise_trt.pth"  |  デフォルトのinference_from_image.pyでよさそう  |
|  C  |  wget https://github.com/kenjirotorii/ai_race/blob/main/ai_race/reinforcement_learning/trt_model/dqn_20210114_trt.pth  |  "$ cd ~/catkin_ws/src/ai_race/ai_race/reinforcement_learning/scripts $ python inference_from_image.py --trt_module --trt_model ~/catkin_ws/src/ai_race/ai_race/reinforcement_learning/trt_model/dqn_20210114_trt.pth"  |  "以下を使う必要ありそう https://github.com/kenjirotorii/ai_race/blob/main/ai_race/reinforcement_learning/scripts/inference_from_image.py"  |
|  D  |  wget https://github.com/anchobi-no/ai_race/releases/download/296fe39/sim_race_only_good_level2_epoch.21.pth  |  python inference_from_image.py --model simplenet --pretrained_model sim_race_only_good_level2_epoch.21.pth  |  デフォルトのinference_from_image.pyでよさそう？  |
|  E  |  wget https://github.com/F0CACC1A/ai_race/releases/download/v2.0/20210113_simplenet_trt.pth  |  python inference_from_image.py --trt_module --trt_model 20210113_simplenet_trt.pth --model simplenet  |  デフォルトのinference_from_image.pyでよさそう  |
|  F  |  wget https://github.com/k-onishi/ai_race/releases/download/v0.2/20210101_model_trt.pth  |  "cd ~/catkin_ws/src/ai_race/ai_race/learning/scripts python inference_from_image.py --trt_module --trt_model 20210101_model_trt.pth"  |  デフォルトのinference_from_image.pyでよさそう  |
|  G  |  wget https://github.com/kyad/ai_race/blob/main/ai_race/learning/scripts/20210105a-simplenet_trt_fp16.pth  |  python inference_from_image.py --model simplenet --trt_module --trt_model 20210105a-simplenet_trt_fp16.pth  |  "「simplenetの実装はフォーク前のリポジトリから変更しているので、ai_race/ai_race/learning/scripts以下はこのリポジトリの実装を使ってください。」のコメントより以下をコピーして動かすhttps://github.com/kyad/ai_race/tree/main/ai_race/learning/scripts"  |
