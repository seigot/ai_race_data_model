# 動作確認用 (20210403)

# 環境準備
## Step1.PC/JetsonNanoを用意して以下の通り接続する <br>

Jetson Nano/PCのIPアドレスはそれぞれ読み変えて設定する <br>
Jetson Nano-PCは有線で繋いで下さい。ネットワーク遅延の影響をなくすため。クロスケーブルで直接接続可能。 <br>

[Jetson Nano/PC間でROS接続する](https://qiita.com/seigot/items/a6eaebccfd427bb315b4)

## Step2.モデルをダウンロード + リリース用リポジトリのclone

Jetson Nano側で以下を実行<br>
（リポジトリは、`~/tmp/`以下に、`git clone http://github.com/seigot/ai_race ai_race.seigot` のように置く。）<br>

```
cd ~/tmp
git clone https://github.com/kenjirotorii/ai_race ai_race.kenjirotorii
git clone https://github.com/F0CACC1A/ai_race ai_race.F0CACC1A
git clone https://github.com/k-onishi/ai_race ai_race.k-onishi
```

## Step3.実行

### PC側の準備

```
# シミュレータ画面を起動
bash prepare.sh -l 1c
bash prepare.sh -l 1s
bash prepare.sh -l 1f
bash prepare.sh -l 1w
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

### Jetson側の準備

推論を実行する<br>
<br>
A

```
xxx
```

B
```
xxx
```

C

```
# 事前にこれをしていること前提
cd ~/tmp
git clone https://github.com/kenjirotorii/ai_race ai_race.kenjirotorii
# $ gz physics -u 300

# 準備
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kenjirotorii ai_race
cd ai_race/scripts
bash prepare.sh -l 1c # 1s,1f,1w

# 実行
cd ~/catkin_ws/src/ai_race/ai_race/your_environment/scripts
python inference_from_image.py --pretrained_model=/home/jetson/catkin_ws/src/ai_race/ai_race/your_environment/models/submit_20210326.pth
```

D

```
xxx
```

E

```
# 事前にこれをしていること前提
cd ~/tmp
git clone https://github.com/F0CACC1A/ai_race ai_race.F0CACC1A
wget https://github.com/F0CACC1A/ai_race/releases/download/v3.0/20210324a_101_simplenet_trt.pth

# 準備
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.F0CACC1A ai_race
cd ai_race/scripts
bash prepare.sh -l 1c # 1s,1f,1w

# 実行
cd ~/catkin_ws/src/ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/20210324a_101_simplenet_trt.pth --model simplenet
```

F

```
# 事前にこれをしていること前提
cd ~/tmp
git clone https://github.com/k-onishi/ai_race ai_race.k-onishi
#wget https://github.com/k-onishi/ai_race/releases/download/v1.0/god_phoenix.pth
wget https://github.com/k-onishi/ai_race/releases/download/v2.0/sphere.pth

# 準備
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.k-onishi ai_race
cd ai_race/scripts
bash prepare.sh -l 1c # 1s,1f,1w

# 実行
cd ~/catkin_ws/src/ai_race/ai_race/your_environment/scripts/reinforce_learning
#python inference_from_image.py --pretrained_model ~/tmp/god_phoenix.pth
python inference_from_image.py --pretrained_model ~/tmp/sphere.pth
```

G

```
xxx
```

その他の有志の方々(参考記録)

```
xxx
```

# 当日準備

```
aaa
```
