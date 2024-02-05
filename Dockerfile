FROM ubuntu:22.04

ADD system /tmp/system
RUN /tmp/system/install.sh
SHELL ["/usr/local/sbin/with-devcontenv", "bash", "-c"]
ENTRYPOINT ["/init"]

WORKDIR /tmp

ARG APT_MIRROR_HOST
ADD packages/apt-mirror packages/apt-mirror
RUN packages/apt-mirror/install.sh

ADD packages/openssh-server packages/openssh-server
RUN packages/openssh-server/install.sh

WORKDIR /root
