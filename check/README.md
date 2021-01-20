# 動作確認用

# 環境準備
## Step1.PC/JetsonNanoを用意して以下の通り接続する <br>

Jetson Nano/PCのIPアドレスはそれぞれ読み変えて設定する

[Jetson Nano/PC間でROS接続する](https://qiita.com/seigot/items/a6eaebccfd427bb315b4)

## Step2.モデルをダウンロード + リリース用リポジトリのclone

Jetson Nano側で以下を実行<br>
（リポジトリは、`~/tmp/`以下に、`git clone http://github.com/seigot/ai_race ai_race.seigot` のように置く。）<br>
<br>
ダウンロード用スクリプトの中身は[こちら](https://github.com/seigot/ai_race_score/blob/main/check/download.sh)<br>

```
mkdir -p ~/tmp; cd ~/tmp;
git clone https://github.com/seigot/ai_race_score
./ai_race_score/check/download.sh
```

## Step3.実行

PC側の準備

```
# シミュレータ画面を起動
bash prepare.sh -l 1t
```

必要に応じてGAZEBOの`RealTimeFactor`を調整する。<br>
`RealTimeFactor`は1.0に近いほうが実時間通りに動作するので望ましい。ただ一方で、`ROS Time`の調整に役立つ。<br>
例えば、`RealTimeFactor`を1.0にする場合、実時間の10secは`ROS Time`の10secに対応するが、<br>
`RealTimeFactor`を0.3にする場合、実時間の10secを`ROS Time`の3.3secに対応させることが可能。<br>
（`ROSTime`の世界で0.33secで処理したい場合でも、実時間で10sec掛けてよいので計算資源が乏しい場合でも実質高速に計算させているかのようにできる。）<br>

```
#（例. RealTimeFactor 0.3にする場合）
gz physics -u 300
```

Jetson側の準備

```
# PC/JetsonNano間のネットワーク帯域が狭い場合、圧縮した画像を利用すると効率が良い
# 通信経路では圧縮画像を用いて、jetsonNano側では /image_raw の代わりに /image_exp をpublishするには以下を実行する
roslaunch sim_environment image_republish.launch

# この場合、推論スクリプトでの画像データsubscribe時に、/image_raw の代わりに /image_expをsubscribeするようにする
# カレントディレクトリ以下の推論スクリプト中の "image_raw" を "image_exp" に置換すると可能になる
find . -name inference_from_image.py | xargs sed -i -e "s/image_raw/image_exp/"
```

推論を実行する<br>
<br>
A

```
# 事前にこれをしていること前提
# git clone https://github.com/kenkenjlab/ai_race ai_race.kenkenjlab
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kenkenjlab ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/20210114_ddqn_per_ckpt0109_trt.pth
```

B
```
# 事前にこれをしていること前提
# git clone https://github.com/sahitaka/ai_race ai_race.sahitaka
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.sahitaka ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/0115_with_noise_trt.pth
```

C

```
# 事前にこれをしていること前提
# git clone https://github.com/kenjirotorii/ai_race ai_race.kenjirotorii
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kenjirotorii ai_race
cd ai_race/ai_race/reinforcement_learning/scripts
#python inference_from_image.py --trt_module --trt_model ~/tmp/dqn_20210114_trt.pth
python inference_from_image.py --trt_module --trt_model ~/tmp/dqn_20210109_jetson_trt.pth
```

D

```
# 事前にこれをしていること前提
# git clone https://github.com/anchobi-no/ai_race ai_race.anchobi-no
# git clone https://github.com/seigot/ai_race ai_race.seigot
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.seigot ai_race
cd ai_race/ai_race/learning/scripts
# python inference_from_image.py --model simplenet --pretrained_model ~/tmp/sim_race_only_good_level2_epoch.21.pth
python inference_from_image.py --model simplenet --trt_module --trt_model ~/tmp/road_following_model_trt.pth
```

E

```
# 事前にこれをしていること前提
# git clone https://github.com/F0CACC1A/ai_race ai_race.F0CACC1A
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.F0CACC1A ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/20210113_simplenet_trt.pth --model simplenet
```

F

```
# 事前にこれをしていること前提
# git clone https://github.com/k-onishi/ai_race ai_race.k-onishi
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.k-onishi ai_race
cd ai_race/ai_race/learning/scripts 
python inference_from_image.py --trt_module --trt_model ~/tmp/20210101_model_trt.pth
```

G

```
# 事前にこれをしていること前提
# git clone https://github.com/kyad/ai_race ai_race.kyad
# $ gz physics -u 300

cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kyad ai_race
cd ai_race/ai_race/learning/scripts 
python inference_from_image.py --model simplenet --trt_module --trt_model ~/tmp/20210105a-simplenet_trt_fp16.pth
```
