ARG base=ubuntu:20.04
FROM "${base}"

ARG script_path=/tmp/devcont-scripts
RUN mkdir -p ${script_path}

ARG ubuntu_archive_url
ADD scripts/set-archive.sh ${script_path}/set-archive.sh
RUN ${script_path}/set-archive.sh

ARG s6_overlay_version
ADD scripts/install-s6-overlay.sh ${script_path}/install-s6-overlay.sh
RUN ${script_path}/install-s6-overlay.sh

ADD scripts/install-common.sh ${script_path}/install-common.sh
RUN ${script_path}/install-common.sh

ARG use_openssh_server=false
ADD scripts/install-openssh-server.sh ${script_path}/install-openssh-server.sh
RUN if [ "${use_openssh_server}" = true ]; then \
        ${script_path}/install-openssh-server.sh; \
    fi

ARG use_docker=false
ADD scripts/install-docker.sh ${script_path}/install-docker.sh
RUN if [ "${use_docker}" = true ]; then \
        ${script_path}/install-docker.sh; \
    fi

ARG use_git=false
ADD scripts/install-git.sh ${script_path}/install-git.sh
RUN if [ "${use_git}" = true ]; then \
        ${script_path}/install-git.sh; \
    fi

ARG use_build_essential=false
ADD scripts/install-build-essential.sh ${script_path}/install-build-essential.sh
RUN if [ "${use_build_essential}" = true ]; then \
        ${script_path}/install-build-essential.sh; \
    fi

ARG use_jdk=false
ADD scripts/install-jdk.sh ${script_path}/install-jdk.sh
RUN if [ "${use_jdk}" = true ]; then \
        ${script_path}/install-jdk.sh; \
    fi

RUN env_path=/var/run/devcontainer/build_environment \
    && mkdir -p ${env_path} \
    && s6-dumpenv ${env_path}

RUN rm -rf ${script_path}

ADD root/ /
ENTRYPOINT ["/init"]
