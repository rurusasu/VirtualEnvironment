# Vagrantの操作コマンド
## 仮想マシンの操作
|コマンド|概要|
| ----  | ---- |
|vagrant up | 仮想マシンの起動<br>Vagrantfileのあるディレクトリ内で実行|
|vagrant halt | 仮想マシンの終了(シャットダウン)|
|vagrant suspend| 仮想マシンの一時停止|
|vagrant resume| 仮想マシンの一時停止から復帰<br>--provisionオプションでプロビジョニング|
|vagrant reload| ≒halt & up|
|vagrant provision| 仮想マシンは起動したままプロビジョニングのみ再度実行|
|vagrant destroy| 仮想マシンの削除(boxは消えない)|
|vagrant status| 仮想マシンのステータスを表示|
|vagrant global-status| 全仮想マシンの一覧(名前、ステータス、パス)|
|vagrant global-status --prune| 全仮想マシンの一覧で削除済みのものが出る場合に|
|vagrant ssh| 仮想マシンにログイン|
|vagrant ssh-config| sshログイン時の設定確認．IdentityFileは秘密鍵の場所|
|vagrant reload --provision| 設定ファイル(site.yml)を変更したらこのコマンドで反映|
|vagrant version| バージョンの確認+最新バージョンの表示<br>(vagrant -vはバージョンの確認のみ)|

## boxの一覧、追加、アップデート、削除
|コマンド|概要|
| ----  | ---- |
|vagrant box list| boxの一覧を表示|
|vagrant box add ○○/○○| boxの追加．Vagrant Cloud、ローカルのbox、URLから取得|
|vagrant box add 付けたい名前 box名.box ||
|vagrant box update --box ○○/○○| 特定のboxのみアップデート<br>(vagrant box updateでまとめて)
|vagrant init box名| boxの初期化(Vagrantfileの作成)|
|vagrant box remove| boxの削除|
|vagrant box remove ○○/○○<br>--box-version 0.0.1| boxの削除(バージョン指定)
|vagant package box名| 現在の仮想マシンをboxに<br>box名省略なら元のbox名|

## スナップショット
|コマンド|概要|
| ----  | ---- |
|vagrant snapshot save <スナップショット名>| スナップショット作成<br>(--provision)を付けると強制的にプロビジョニング<br>(--no-privision)を付けると強制的にプロビジョニングさせない|
|vagrant snapshot restore <スナップショット名>| スナップショット復元<br>--[no]provisionはsaveと同じ|
|vagrant snapshot delete <スナップショット名>| スナップショットの削除|
|vagrant snapshot list| 名前付きスナップショットの一覧を表示|

## プラグイン
|コマンド|概要|
| ----  | ---- |
|vagrant plugin list| プラグインの一覧|
|vagrant plugin install <プラグイン名1> <プラグイン名2>| プラグインのインストール|
|vagrant plugin uninstall <プラグイン名1> <プラグイン名2>| プラグインのアンインストール|
|vagrant plugin update [names...]| プラグインのアップデート<br>名前省略ですべてのプラグイン|
|vagrant plugin repair| 初期化に失敗したプラグインの修復を試みる|
|vagrant plugin expunge --reinstall| アンインストールして再インストール|

## Vagrant Cloud
|コマンド|概要|
| ----  | ---- |
|vagrant login| ログイン|
|vagrant share| ローカル環境を公開<br>表示されるURLで外部からアクセス可能に．<br>Ctrl + Cで終了|
|vagrant connect xxxxx| SSHなどでの接続も可能．<br>セキュリティ的リスクはあるが便利な場面も|