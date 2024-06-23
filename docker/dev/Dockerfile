ARG VARIANT="8.10-20240528"
FROM almalinux:${VARIANT}

ARG USER_NAME="user"
ARG USER_UID="1000"
ARG USER_GID="1000"

RUN dnf update -y \
    && dnf install -y \
        sudo

RUN groupadd --gid ${USER_GID} ${USER_NAME} \
    && useradd \
        --shell /bin/bash \
        --create-home \
        --home-dir /home/${USER_NAME} \
        --uid ${USER_UID} \
        --gid ${USER_GID} \
        ${USER_NAME} \
    && echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_NAME}

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
