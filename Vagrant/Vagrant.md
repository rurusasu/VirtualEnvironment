# Vagrant(ベイグラント)を使うメリット
## 環境の差異により発生する不具合を最小限に抑えることができる
開発環境を整えるには、ChefやAnsibleなどの構成管理ツールを使って、構築手順を自動化するのがおすすめです．構成管理ツールには以下のメリットがあります．
* 構築手順がコード管理可能になる
* どんな処理を行っているか明確になる
* 簡単に共有できるようになる
* 何度でも同じ結果を得ることができる(冪等性)


# 用語
## Boxファイル
仮想マシン起動時のテンプレートとなるイメージファイル．\
[Vagrant Cloud](https://app.vagrantup.com/boxes/search)に色々なBoxファイルが公開されているので，それを使うのが手っ取り早い．\
自分でBoxファイルを作成することも可能

## Vagrantfile
仮想マシンの構成を記述するファイル
主に以下の項目を設定する．
* 起動する仮想マシンの指定
* ネットワーク設定
* 共有フォルダ設定
* マシンスペック設定(CPUやメモリ割り当てなど)
* プロビジョニング(シェルスクリプトや構成管理ツールの実行指定)

## プロバイダ
仮想化ソフトのこと．
Vagrantでは，デフォルトでVirtualBoxをサポートしているが，プラグインをインストールするVMwareやParallels、AWS(EC2)などにも対応可能です．

## プロビジョニング
ミドルウェアのインストールや設定を行うツール．
ここではシェルスクリプトや，構成管理ツール(Chef，Puppet，Ansibleなど)のことを指します．
Vagrantfile内で指定する．

## 共有フォルダ
ローカルと仮想マシン間でファイルを同期する機能が用意されています．
デフォルトでは，ローカルのVagrantfileがあるフォルダと，仮想マシンの/vagrant が同期されています．
他のフォルダを指定したい場合は，Vagrantfileのconfig.vm.synced_folderに指定する．


# 仮想マシン構築例
## Boxを検索
[Vagrant Cloud](https://app.vagrantup.com/boxes/search)でインストールするBoxファイルを検索する．
「centos」などで検索するといくつもヒットする．
例えば「bento/centos-6.7」というBoxがあるが，これは ユーザ名/Box名という意味です．
検索結果一覧でBox名をクリックすると，以下のようにプロバイダに応じて実行すべきvagrantコマンドが記載されているので，こちらを後で実行する．\
`virtualbox`\
`Hosted (227 MB)`\
`vagrant init bento/centos-6.7; vagrant up --provider virtualbox`\

## フォルダを作成
まず，わかりやすいようにVagrant専用のフォルダを作成する．\
コマンドプロンプト\
`mkdir C:Vagrant & cd C:\Vagrant`\
次に各仮想マシン用のフォルダを作成します．\
`mkdir centos67 & cd centos67`

## Vagrantを初期化
先ほど確認したコマンドを実行する．\
`vagrant init bento/centos-6.7`\
centos67フォルダにVagrantfileが作成される．

## vagrantfileを編集
作成されたVagrantfileをテキストエディタで編集する．
Vagrantfile

## 仮想マシンを起動
コマンドプロンプト\
`vagrant up`\
上記では，`vagrant up --provider virtualbox`となっていたが，デフォルトのプロバイダがVirtualBoxなので特に指定する必要なし．
指定したBoxが登録されていない場合は，自動的にダウンロードしてBox追加(vagrant box add)してくれる．\

以下のエラーが出るがWindows版のバグのようなもので，放置していると共有フォルダが使えなくなる．\
`Stderr from command:`\
`chown: changing ownership of /Vagrant: Not a directory`\



# VagrantとDocker
## Vagrantのみを使う
* 素早く簡単に環境を立てたり壊したりしたい
* Vagrantが重くて辛い
* マイクロサービス開発

## Dockerのみを使う
* オンプレシングルサーバ向けに開発
* いろいろインストールして安定して使える環境が欲しい
* ホストOSの影響をできるだけ受けたくない

## VagrantとDockerを併用する
* WindowsやMacなどの複数の環境でマイクロサービスを開発したい
* Vagrant上にDockerを立てることで、環境を汚さずに開発が行える

