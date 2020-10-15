ARG base=ubuntu:20.04
FROM "${base}"

ARG script_path=/tmp/devcontainer/scripts
RUN mkdir -p ${script_path}

ARG ubuntu_archive_url
ADD scripts/install-common.sh ${script_path}/install-common.sh
RUN ${script_path}/install-common.sh

ARG s6_overlay_version
ADD scripts/install-s6-overlay.sh ${script_path}/install-s6-overlay.sh
RUN ${script_path}/install-s6-overlay.sh

ARG use_openssh_server=false
ADD scripts/install-openssh-server.sh ${script_path}/install-openssh-server.sh
RUN if [ "${use_openssh_server}" = true ]; then \
        ${script_path}/install-openssh-server.sh; \
    fi

RUN env_path=/var/run/devcontainer/build_environment \
    && mkdir -p ${env_path} \
    && s6-dumpenv ${env_path}

ADD root/ /
ENTRYPOINT ["/init"]
