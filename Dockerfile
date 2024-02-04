FROM ubuntu:22.04

ADD system /tmp/system
RUN /tmp/system/install.sh
SHELL ["with-devcont", "/bin/bash", "-c"]
ENTRYPOINT ["/usr/bin/devcont-init", "/sbin/init"]

WORKDIR "/tmp"

ADD packages/openssh-server openssh-server
RUN openssh-server/install.sh
