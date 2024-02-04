FROM ubuntu:22.04

ADD system /tmp/system
RUN /tmp/system/install.sh
SHELL ["/usr/local/sbin/with-devcont", "/bin/bash", "-c"]
ENTRYPOINT ["/usr/local/sbin/devcont-init", "/sbin/init"]

WORKDIR "/tmp"

ADD packages/kakao-mirror kakao-mirror
RUN kakao-mirror/install.sh

# ADD packages/openssh-server openssh-server
# RUN openssh-server/install.sh
