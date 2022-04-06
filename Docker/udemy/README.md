# InRelease is not valid yet エラーが表示された場合

Dockerfile 中で以下のコマンドを実行した場合，

```Dockerfile
RUN apt-get update
```

ホストとコンテナ間の時刻の同期が取れていないと，`E: Release file for ... InRelease is not valid yet.` エラーが発生する．

## 解決手段

今回は，[WSL 側の時刻ズレが原因](https://qiita.com/npkk/items/ebc31451bd604bc297c1)だった．そのため，以下のコマンドを実行することにより解決した．

```cmd
wsl -d docker-desktop
hwclock -s
```
