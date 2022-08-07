# WSL 上で Docker daemon を立ち上げる場合

```bash
sudo service docker start
```

# InRelease is not valid yet エラーが表示された場合

Dockerfile 中で以下のコマンドを実行した場合，

```Dockerfile
RUN apt-get update
```

ホストとコンテナ間の時刻の同期が取れていないと，`E: Release file for ... InRelease is not valid yet.` エラーが発生する．

## 解決手段

今回は，[WSL 側の時刻ズレが原因](https://qiita.com/npkk/items/ebc31451bd604bc297c1)だった．そのため，ホスト側（Windows 11）で以下のコマンドを実行することにより解決した．

```cmd
wsl -d docker-desktop
hwclock -s
```

# W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/focal/InRelease が表示された場合


Dockerfile 中で以下のコマンドを実行した場合，

```Dockerfile
RUN apt-get update
```

名前解決ができていないと、`W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/focal/InRelease  Temporary failure resolving 'archive.ubuntu.com'` エラーが発生する．

## 解決手段

これは、[docker image build時に、DNSの設定をなんとかしたい](https://kazuhira-r.hatenablog.com/entry/2020/04/12/194225)で紹介されていた `docker build` 時に `--network` オプションを追加することで解決した．

```bash
docker build --network host .
```
