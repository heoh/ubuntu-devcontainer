#!/usr/local/sbin/with-devcont bash

sed -i "s@archive.ubuntu.com@mirror.kakao.com@g" /etc/apt/sources.list
apt update
