# readme

```
C
■ チーム名
GoToLearn

■ リリース URL
https://github.com/kenjirotorii/ai_race/releases/tag/v2.0

■ 学習モデル
submit_20210326.pth

■ 動かし方
cd /home/jetson/catkin_ws/src/ai_race/ai_race/your_environment/scripts
python inference_from_image.py --pretrained_model=/home/jetson/catkin_ws/src/ai_race/ai_race/your_environment/models/submit_20210326.pth
```

```
E
■ チーム名
"BiGinners" (E班)

■ リリース URL
https://github.com/F0CACC1A/ai_race/releases/tag/v3.0

■ 学習モデル
20210324a_101_simplenet_trt.pth

■ 動かし方
python inference_from_image.py --trt_module --trt_model 20210324a_101_simplenet_trt.pth --model simplenet
```

```
F
■チーム名
「AI全集中トップガン、ボーナスありがとうございますゴッドフェニックス」

■URL
https://github.com/k-onishi/ai_race/releases/tag/v1.0

■モデル
god_phoenix.pth

■動かし方
cd ~/catkin_ws/src
git clone https://github.com/k-onishi/ai_race
cd ai_race/ai_race/your_environment/scripts/reinforce_learning
python inference_from_image.py --pretrained_model god_phoenix.pth
```
