#!/usr/local/sbin/with-devcontenv bash

[ ! -z ${all_proxy+x} ] && . devcont-export all_proxy="$all_proxy" || . devcont-unset all_proxy
[ ! -z ${ftp_proxy+x} ] && . devcont-export ftp_proxy="$ftp_proxy" || . devcont-unset ftp_proxy
[ ! -z ${http_proxy+x} ] && . devcont-export http_proxy="$http_proxy" || . devcont-unset http_proxy
[ ! -z ${https_proxy+x} ] && . devcont-export https_proxy="$https_proxy" || . devcont-unset https_proxy
[ ! -z ${no_proxy+x} ] && . devcont-export no_proxy="$no_proxy" || . devcont-unset no_proxy

[ ! -z ${ALL_PROXY+x} ] && . devcont-export ALL_PROXY="$ALL_PROXY" || . devcont-unset ALL_PROXY
[ ! -z ${FTP_PROXY+x} ] && . devcont-export FTP_PROXY="$FTP_PROXY" || . devcont-unset FTP_PROXY
[ ! -z ${HTTP_PROXY+x} ] && . devcont-export HTTP_PROXY="$HTTP_PROXY" || . devcont-unset HTTP_PROXY
[ ! -z ${HTTPS_PROXY+x} ] && . devcont-export HTTPS_PROXY="$HTTPS_PROXY" || . devcont-unset HTTPS_PROXY
[ ! -z ${NO_PROXY+x} ] && . devcont-export NO_PROXY="$NO_PROXY" || . devcont-unset NO_PROXY
