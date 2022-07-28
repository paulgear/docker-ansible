FROM    paulgear/base

ARG     PKGS="gpg-agent software-properties-common"
ARG     PPA="ppa:ansible/ansible"
ARG     PPA_PKGS="ansible"

ENV     DEBIAN_FRONTEND=noninteractive

RUN     apt update && \
        apt install --no-install-recommends -y ${PKGS} && \
        add-apt-repository ${PPA} && \
        apt install --no-install-recommends -y ${PPA_PKGS} && \
        apt upgrade --autoremove --purge -y && \
        rm -rf /var/lib/apt/lists/*
