# Vagrantfile
## -Vagrantfileの作成
以下のコマンドを任意のディレクトリ上で実行することにより，Vagrantfileを作成することができる．
```
$ vagrant init
```

## -Vagrantfileの編集
デフォルトで書いてあるコメントを参考に編集していく．
設定内容は，
```
Vagarnt.configure("2") do |config|
~
end
```
の中に書いていく．

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # box名。たまに使うから短くてわかりやすい名前にしましょう。
  config.vm.box = "akippa_ubuntu"

  # boxのURL Ubuntu16.04はこれ
  config.vm.box_url = "http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"

  # 仮想マシンのネットワーク環境設定。
  # 目的に応じて以下のどちらかを使いましょう。
  # "private_network"を指定するとホストOSからのみアクセス可
  config.vm.network "private_network", ip: "172.16.16.1"
  # "forwarded_port"を指定するとhostの8080ポートへのアクセスがguestの80ポートへ転送されます。
  # http://[ホストのIPアドレス]:8080でアクセスできるってことですよ。
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # ホスト側とゲスト側で共有するフォルダ。この場合Vagrantfileが存在するフォルダが/var/www/akippaになりまっせ。
  config.vm.synced_folder "./", "/var/www/akippa"

  # プロバイダの指定
  config.vm.provider "virtualbox" do |vb|
    # GUIはいらないね
    vb.gui = false
    # 仮想マシンの名前
    vb.name = "akippa"
    # 仮想マシンが使うメモリ(MB)
    vb.memory = "2048"
    # 仮想マシンが使うCPU
    vb.cpus = 4
  end

  # プロビジョンの内容をsetup.shに書いておきます。
  # setup.shの内容についてはまた次回。
  config.vm.provision "shell", path: "setup.sh"
end
```