# ai_race_score

## 本リポジトリについて
ai_race のscore集約ページです : https://github.com/seigot/ai_race <br>
<br>
## 途中結果

チーム名とscoreをご自由に更新下さい。 <br>

|  チーム名  |  score  |　備考  |  最新の学習モデルの、リポジトリURL等  |
| ---- | ---- | ---- | ---- |
|  seigot  |  1周  |  11/11時点  |  https://github.com/seigot/ai_race_data_sample/blob/main/model/sample.pth  |
|  A  |  -  |  -  |  -  |
|  B  |  -  |  -  |  -  |
|  C  |  -  |  -  |  -  |
|  D  |  -  |  -  |  -  |
|  E  |  -  |  -  |  -  |
|  F  |  -  |  -  |  -  |

## Tips

trtファイル等の大きなデータは、以下の通り分割・結合することも可能です。<br>
<br>
分割<br>

```
split -b 55m -a 1 sample_trt.pth sample_trt_p
```

結合

```
cat sample_trt_p_* > sample_trt.pth
```

## 備考
> [https://docs.github.com/ja/free-pro-team@latest/github/managing-large-files/conditions-for-large-files](https://docs.github.com/ja/free-pro-team@latest/github/managing-large-files/conditions-for-large-files) <br>
> 50 MBより大きいファイルを追加または更新しようとすると、Gitから警告が表示されます。<br>

> [https://docs.github.com/ja/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota](https://docs.github.com/ja/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota) <br>
> リポジトリは小さく保ち、理想としては1GB 未満、および5GB未満にすることを強くお勧めします。<br>

## 状態
お試し利用中
