FROM ubuntu:22.04

ADD system /tmp/system
RUN /tmp/system/install.sh
