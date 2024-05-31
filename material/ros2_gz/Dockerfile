FROM nvidia/opengl:base-ubuntu22.04

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Timezone, Launguage設定
RUN apt update &&\
    apt install -y --no-install-recommends \
    locales \
    software-properties-common tzdata &&\
    locale-gen ja_JP ja_JP.UTF-8 &&\
    update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8 &&\
    add-apt-repository universe

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

# install gui tool
# gui tools
RUN apt-get update && \
    apt-get install -y libqt5gui5\
    mesa-utils && \
    rm -rf /var/lib/apt/lists/*
ENV QT_DEBUG_PLUGINS=1

# install gazebo
RUN apt-get update &&\
    apt-get install -y lsb-release wget gnupg &&\
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null &&\
    apt-get update &&\
    apt-get install -y ignition-fortress &&\
    rm -rf /var/lib/apt/lists/*

# install slamtoolbox
RUN apt-get update &&\
    apt-get install -y ros-humble-slam-toolbox &&\
    rm -rf /var/lib/apt/lists/*

# install nav2
RUN apt-get update &&\
    apt-get install -y ros-humble-navigation2 &&\
    apt-get install -y ros-humble-nav2-bringup &&\
    rm -rf /var/lib/apt/lists/*

# Add user and group, then allow sudo
ARG UID
ARG GID
ARG PASSWORD
ARG USER_NAME
ARG GROUP_NAME

RUN groupadd -g ${GID} ${GROUP_NAME}
RUN useradd -u ${UID} -g ${GID} -G sudo -s /bin/bash -m ${USER_NAME}
RUN echo "${USER_NAME}:${PASSWORD}" | chpasswd
RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER ${USER_NAME}

CMD ["/bin/bash"]
