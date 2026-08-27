ARG VARIANT="ubuntu26.04"
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

# Disable password authentication for SSH
RUN mkdir -p /etc/ssh/sshd_config.d \
    && printf 'PasswordAuthentication no\n' \
       > /etc/ssh/sshd_config.d/99-devcontainer.conf

# Configure vscode user
ARG VSCODE_UID=1000
ARG VSCODE_GID=1000

RUN groupmod --gid "${VSCODE_GID}" vscode \
    && usermod --uid "${VSCODE_UID}" --gid "${VSCODE_GID}" vscode \
    && chown -R "${VSCODE_UID}:${VSCODE_GID}" /home/vscode

# Configure user
ARG USERNAME=user
ARG USER_UID=1001
ARG USER_GID=1001

RUN groupadd --gid "${USER_GID}" "${USERNAME}" \
    && useradd \
        --uid "${USER_UID}" \
        --gid "${USER_GID}" \
        --create-home \
        --shell /bin/bash \
        "${USERNAME}" \
    && echo "${USERNAME}:${USERNAME}" | chpasswd \
    && usermod -aG sudo "${USERNAME}" \
    && printf '%s ALL=(ALL:ALL) ALL\n' "${USERNAME}" \
        > "/etc/sudoers.d/${USERNAME}" \
    && chmod 0440 "/etc/sudoers.d/${USERNAME}"

USER ${USERNAME}
