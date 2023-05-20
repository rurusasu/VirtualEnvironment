#!/bin/bash

# conda 仮想環境作成
export VM_NAME=open3d
# 仮想環境を一度削除
conda deactivate
conda remove -yn ${VM_NAME} --all
# 不要になったパッケージも削除
conda clean --all
# 再度仮想環境を作成
conda create -yn ${VM_NAME} python=3.8
conda activate ${VM_NAME}

# <<< Open3D Setup <<<
# REF: https://karaage.hatenadiary.jp/entry/2018/03/12/073000
sudo pip3 install --upgrade pip
sudo pip install open3d-python

# <<< ROS Setup <<<
# REF: http://wiki.ros.org/action/fullsearch/Installation/Ubuntu?action=fullsearch&context=180&value=linkto%3A%22Installation%2FUbuntu%22
# sources.listを設定する
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# キーを設定する
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt -y update &&
  sudo apt -y install ros-noetic-desktop-full
apt search ros-noetic

# 環境設定
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >>~/.bashrc
source ~/.bashrc

# 依存関係のインストール
conda activate ${VM_NAME}
sudo apt -y install \
  build-essential \
  python3-rosdep \
  python3-rosinstall \
  python3-rosinstall-generator \
  python3-wstool

# rosdep の設定
sudo rosdep init
rosdep update

# <<< catkin_tools Setup <<<
# catkin_tools インストール
# REF: https://catkin-tools.readthedocs.io/en/latest/installing.html
sudo sh \
  -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" \
        > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt update &&
  sudo apt install python3-catkin-tools
# catkin ワークスペースの設定
sudo rm -rf ~/catkin_ws
sudo mkdir -p ~/catkin_ws
cd ~/catkin_ws
sudo mkdir -p src
#cd src
#catkin_init_workspace
#cd ..
sudo mkdir -p build
# ディレクトリへのアクセス許可
# REF: https://answers.ros.org/question/368773/ioerror-errno-13-permission-denied-homepiros_catkin_wsbuild_isolatedbuilt_by/
sudo chown $USER: -R /home/${USER}/catkin_ws
# catkin make に必要なパッケージをインストール
# REF: https://bbs.archlinux.org/viewtopic.php?id=247450
# REF: https://github.com/ryuichiueda/pimouse_slam/issues/1
pip3 install \
  empy \
  rospkg

# catkin に python3 を使用するように指示
# REF: https://bbs.archlinux.org/viewtopic.php?id=247450
# REF: http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment
catkin_make -DPYTHON_EXECUTABLE=/opt/conda/envs/open3d/bin/python3

source devel/setup.bash
# ROS_PACKAGE_PATH環境変数にディレクトリが含まれていることを確認。
echo $ROS_PACKAGE_PATH
