# ------------ ベースとなるイメージファイル
FROM ubuntu:22.04

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# ------------ タイムゾーンの設定
RUN apt update \
    && apt install -y --no-install-recommends \
    locales \
    software-properties-common tzdata \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && add-apt-repository universe
ENV LANG en_US.UTF-8
ENV TZ=Asia/Tokyo

# ------------ Ubuntu上での環境構築
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

# ------------ ROS2のインストール
RUN apt-get install curl gnupg lsb-release -y \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt-get update \
    && apt-get install -y ros-humble-desktop \
    && apt-get install -y python3-colcon-common-extensions \
    && apt-get install -y python3-rosdep \
    && apt-get install -y python3-argcomplete
RUN rosdep init \
    && rosdep update

# Add user and group
ARG UID
ARG GID
ARG USER_NAME
ARG GROUP_NAME
ARG WORKDIR

RUN groupadd -g ${GID} ${GROUP_NAME}
RUN useradd -u ${UID} -g ${GID} -s /bin/bash -m ${USER_NAME}

USER ${USER_NAME}

WORKDIR /home/kousei/robotics

CMD ["/bin/bash"]
