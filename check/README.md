# 動作確認用

以下は確認用の一覧表

|  -  |  ダウンロード方法(コマンド)  |  ■ 動かし方  |  備考  |
| ---- | ---- | ---- | ---- |
|  A  |  wget https://github.com/kenkenjlab/ai_race/releases/download/v1.1/20210114_ddqn_per_ckpt0109_trt.pth  |  python inference_from_image.py --trt_module --trt_model 20210114_ddqn_per_ckpt0109_trt.pth  |  デフォルトのinference_from_image.pyでよさそう  |
|  B  |  wget https://github.com/sahitaka/ai_race/releases/download/v1.2/0115_with_noise_trt.pth  |  "cd ~/catkin_ws/src/ai_race/learning/scripts python inference_from_image.py --trt_module --trt_model 0115_with_noise_trt.pth"  |  デフォルトのinference_from_image.pyでよさそう  |
|  C  |  curl --output dqn_20210114_trt.pth https://raw.githubusercontent.com/kenjirotorii/ai_race/main/ai_race/reinforcement_learning/trt_model/dqn_20210114_trt.pth |  "$ cd ~/catkin_ws/src/ai_race/ai_race/reinforcement_learning/scripts $ python inference_from_image.py --trt_module --trt_model ~/catkin_ws/src/ai_race/ai_race/reinforcement_learning/trt_model/dqn_20210114_trt.pth"  |  "以下を使う必要ありそう https://github.com/kenjirotorii/ai_race/blob/main/ai_race/reinforcement_learning/scripts/inference_from_image.py"  |
|  D  |  wget https://github.com/anchobi-no/ai_race/releases/download/296fe39/sim_race_only_good_level2_epoch.21.pth  |  python inference_from_image.py --model simplenet --pretrained_model sim_race_only_good_level2_epoch.21.pth  |  デフォルトのinference_from_image.pyでよさそう？  |
|  E  |  wget https://github.com/F0CACC1A/ai_race/releases/download/v2.0/20210113_simplenet_trt.pth  |  python inference_from_image.py --trt_module --trt_model 20210113_simplenet_trt.pth --model simplenet  |  デフォルトのinference_from_image.pyでよさそう  |
|  F  |  wget https://github.com/k-onishi/ai_race/releases/download/v0.2/20210101_model_trt.pth  |  "cd ~/catkin_ws/src/ai_race/ai_race/learning/scripts python inference_from_image.py --trt_module --trt_model 20210101_model_trt.pth"  |  デフォルトのinference_from_image.pyでよさそう  |
|  G  |  curl --output 20210105a-simplenet_trt_fp16.pth https://raw.githubusercontent.com/kyad/ai_race/main/ai_race/learning/scripts/20210105a-simplenet_trt_fp16.pth  |  python inference_from_image.py --model simplenet --trt_module --trt_model 20210105a-simplenet_trt_fp16.pth  |  "「simplenetの実装はフォーク前のリポジトリから変更しているので、ai_race/ai_race/learning/scripts以下はこのリポジトリの実装を使ってください。」のコメントより以下をコピーして動かすhttps://github.com/kyad/ai_race/tree/main/ai_race/learning/scripts"  |


# 環境準備
## Step1.PC/JetsonNanoを用意して以下の通り接続する <br>

Jetson Nano/PCのIPアドレスはそれぞれ読み変えて設定する

[Jetson Nano/PC間でROS接続する](https://qiita.com/seigot/items/a6eaebccfd427bb315b4)

## Step2.モデルをダウンロード

Jetson Nano側で以下を実行<br>
モデルダウンロード + リリース用リポジトリのcloneを行う。<br>
（リポジトリは、`~/tmp/`以下に、`git clone http://github.com/seigot/ai_race ai_race.seigot` のように置く。）

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
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kenkenjlab ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/20210114_ddqn_per_ckpt0109_trt.pth
```

B
```
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.sahitaka ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/0115_with_noise_trt.pth
```

C

```
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kenjirotorii ai_race
cd ai_race/ai_race/reinforcement_learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/dqn_20210114_trt.pth
```

D

```
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.anchobi-no ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --model simplenet --pretrained_model ~/tmp/sim_race_only_good_level2_epoch.21.pth
```

E

```
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.F0CACC1A ai_race
cd ai_race/ai_race/learning/scripts
python inference_from_image.py --trt_module --trt_model ~/tmp/20210113_simplenet_trt.pth --model simplenet
```

F

```
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.k-onishi ai_race
cd ai_race/ai_race/learning/scripts 
python inference_from_image.py --trt_module --trt_model ~/tmp/20210101_model_trt.pth
```

G

```
cd ~/catkin_ws/src
sudo rm -rf ai_race
cp -r ~/tmp/ai_race.kyad ai_race
cd ai_race/ai_race/learning/scripts 
python inference_from_image.py --model simplenet --trt_module --trt_model ~/tmp/20210105a-simplenet_trt_fp16.pth
```
