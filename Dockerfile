FROM ubuntu:18.04
ENV USER root
RUN apt-get update -y
RUN apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
    zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
    htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
    dosfstools vim-common liblz4-tool
RUN apt-get install -y git make python-networkx
RUN apt-get install -y libncurses5-dev libssl-dev zlib1g-dev gawk minicom
RUN apt-get install -y exfat-fuse exfat-utils
RUN git clone https://github.com/friendlyarm/prebuilts.git -b master --depth 1 && \
    cd prebuilts/gcc-x64 && cat toolchain-6.4-aarch64.tar.gz* | tar xz -C / && \
    cat toolchain-4.9.3-armhf.tar.gz* | tar xz -C /

ENV PATH="/opt/FriendlyARM/toolchain/6.4-aarch64/bin:${PATH}"

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo && \
    chmod +x /usr/local/bin/repo

RUN curl -L https://github.com/aktau/github-release/releases/download/v0.6.2/linux-amd64-github-release.tar.bz2 | tar -C /tmp -jx && \
    mv /tmp/bin/linux/amd64/github-release /usr/local/bin/

RUN which repo && \
    which github-release
