FROM ubuntu:22.04

ADD system /tmp/system
RUN /tmp/system/install.sh
SHELL ["/usr/local/sbin/with-devcontenv", "bash", "-c"]
ENTRYPOINT ["/init"]

WORKDIR /tmp



WORKDIR /root
