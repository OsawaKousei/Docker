FROM n622jwith/ros2_zenoh:latest

# gui tools
RUN apt-get update && \
    apt-get install -y libqt5gui5 && \
    rm -rf /var/lib/apt/lists/*
ENV QT_DEBUG_PLUGINS=1

# Add user and group
ARG UID
ARG GID
ARG USER_NAME
ARG GROUP_NAME

RUN groupadd -g ${GID} ${GROUP_NAME}
RUN useradd -u ${UID} -g ${GID} -s /bin/bash -m ${USER_NAME}

USER ${USER_NAME}

CMD ["/bin/bash"]
