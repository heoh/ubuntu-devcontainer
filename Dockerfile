FROM ubuntu:22.04

ADD system /tmp/system
RUN /tmp/system/install.sh
SHELL ["/usr/local/sbin/with-devcont", "/bin/bash", "-c"]
ENTRYPOINT ["/usr/local/sbin/devcont-init", "/usr/bin/dumb-init", "--"]
CMD ["tail", "-f", "/dev/null"]

WORKDIR "/tmp"

ADD packages/kakao-mirror kakao-mirror
RUN kakao-mirror/install.sh

# ADD packages/ubuntu-desktop ubuntu-desktop
# RUN ubuntu-desktop/install.sh

# ARG S6_OVERLAY_VERSION=3.1.6.2
# ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
# RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
# ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
# RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
# ENTRYPOINT ["/init"]

RUN apt install -y init
ENTRYPOINT ["/usr/local/sbin/devcont-init", "/sbin/init", "--"]
CMD ["tail", "-f", "/dev/null"]

# ADD packages/openssh-server openssh-server
# RUN openssh-server/install.sh
