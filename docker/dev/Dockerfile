ARG VARIANT="8.10-20240528"
FROM almalinux:${VARIANT}

ARG USER_NAME
ARG USER_PASSWORD
ARG USER_UID
ARG USER_GID

RUN dnf update -y \
    && dnf install -y epel-release \
    && dnf install -y --enablerepo=epel \
        procps \
        sudo \
        git \
        openssh-server \
        supervisor

RUN groupadd --gid ${USER_GID} ${USER_NAME} \
    && useradd \
        --shell /bin/bash \
        --create-home \
        --home-dir /home/${USER_NAME} \
        --uid ${USER_UID} \
        --gid ${USER_GID} \
        ${USER_NAME} \
    && echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_NAME} \
    && echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd

COPY entrypoint.d /entrypoint.d
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["sudo", "/entrypoint.sh"]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/run/supervisor /var/log/supervisor \
    && chmod -R 755 /var/run/supervisor /var/log/supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

EXPOSE 22
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
