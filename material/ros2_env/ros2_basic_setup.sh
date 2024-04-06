#!/bin/bash -e

# ------------ 環境設定
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# ------------ ワークスペースの作成
mkdir -p home/kousei/ros2_ws/src
cd home/kousei/ros2_ws/ && colcon build

# ------------ 環境設定を反映
source ~/.bashrc
