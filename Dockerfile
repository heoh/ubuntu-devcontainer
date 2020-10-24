ARG base=ubuntu:20.04
FROM "${base}"

# Initialize build
ARG script_path=/tmp/devcont-scripts
RUN mkdir -p ${script_path}

ADD root/usr/bin/*devcont* /usr/bin/
SHELL ["/usr/bin/with-devcontenv", "bash", "-c"]

ARG ubuntu_archive_url
ADD scripts/set-archive.sh ${script_path}/set-archive.sh
RUN ${script_path}/set-archive.sh

ARG s6_overlay_version
ADD scripts/install-s6-overlay.sh ${script_path}/install-s6-overlay.sh
RUN ${script_path}/install-s6-overlay.sh

# Install packages
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

ARG use_conda=false
ADD scripts/install-conda.sh ${script_path}/install-conda.sh
RUN if [ "${use_conda}" = true ]; then \
        ${script_path}/install-conda.sh; \
    fi

ARG use_yarn=false
ADD scripts/install-yarn.sh ${script_path}/install-yarn.sh
RUN if [ "${use_yarn}" = true ]; then \
        ${script_path}/install-yarn.sh; \
    fi

# Finalize build
ADD scripts/export-args.sh ${script_path}/export-args.sh
RUN ${script_path}/export-args.sh

RUN rm -rf ${script_path}

ADD root/ /
ENTRYPOINT ["/init"]
