# install-cuda-on-wsl.sh の実行コマンド
# REF: https://astherier.com/blog/2021/07/windows11-cuda-on-wsl2-setup/

```bash
wget https://astherier.com/static/blog/2021-07-17/install-cuda-on-wsl.sh
source ./install-cuda-on-wsl.sh
```

# install-miniconda-on-wsl.sh の実行コマンド

```bash
source ./install-miniconda-on-wsl.sh
```

# install-pclpy-on-wskl.sh の実行コマンド

まず、pcl 本体の設定を行う。

```bash
source ./install-pcl-on-wsl.sh
```

次に、python用 pcl パッケージである pclpy の設定を行う。

```bash
source ./install-pclpy-on-wsl.sh
```