FROM ubuntu:22.04

# apt update
RUN apt-get update
RUN apt-get install -y sudo

# Add user and group
ARG UID
ARG GID
ARG PASSWORD
ARG USER_NAME
ARG GROUP_NAME

# Add user and allow sudo
RUN groupadd -g ${GID} ${GROUP_NAME}
RUN useradd -u ${UID} -g ${GID} -G sudo -s /bin/bash -m ${USER_NAME}
RUN echo "${USER_NAME}:${PASSWORD}" | chpasswd
RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER_NAME}

CMD ["/bin/bash"]
