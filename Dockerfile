FROM ubuntu:bionic
MAINTAINER Johnathan Sharratt <sharrattj@tokera.com>
RUN echo "v001" && \
    apt-get -yq update && \
    apt-get -yq upgrade
COPY 01_nodoc /etc/dpkg/dpkg.cfg.d
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -yq install \
    apt-utils \
    cowsay pv jq lshw numactl ebtables iptables \
    irqbalance ethtool tcpdump wget curl dmidecode sed \
    fuse iproute2 lzop tar procps attr && \
    mkdir -p /usr/share/man/man5 && \
    mkdir -p /usr/share/man/man8 && \
    mkdir -p /usr/share/man/ja/man5 && \
    mkdir -p /usr/share/man/ja/man8
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -yq install \
    libblkid1 libreadline5 libudev1 libcpg4 libdlm3 \
    mdadm parted gdisk \
    corosync radvd dlm pimd python dpdk udev git \
    squashfs-tools iperf3 dhcpd udhcpc ntp rsync sshfs
COPY keyboard /etc/default
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -yq install \
    cmatrix \
    nano \
    htop iotop \
    ocfs2-tools gfsd \
    openssh-server openssh-client \
    libcurl4 libmxml1 libcrypto++6 libpthread-workqueue0 qrencode libmnl0 \
    libaio1 libk5crypto3 libhcrypto4-heimdal libcryptsetup12 libgcrypt20 \
    hostname sudo cgroupfs-mount vim-common rng-tools syslog-ng logrotate net-tools \
    avahi-autoipd nmap inetutils-ping arping strace \
    udev libxml2-utils socat ntpstat \
    plymouth plymouth-themes cowsay \
    dnsutils ipvsadm ntfs-3g \
    cpio pigz lsof libssh2-1 libjemalloc1 \
    apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    bind9 bind9utils \
    isc-dhcp-server dosfstools bridge-utils \
    expect lvm2 lvm2-lockd clvm shellinabox python-pip gdb
RUN pip install numpy
