ARG PACKER_VERSION=1.8.5
FROM "docker.io/hashicorp/packer:light-${PACKER_VERSION}" as packer_bin
FROM docker.io/ubuntu:20.04
SHELL ["/bin/bash", "-euxc"]
COPY --from=packer_bin /bin/packer /usr/local/bin/packer
RUN set -o pipefail \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
        unzip \
        ca-certificates \
        libxinerama-dev \
        libxtst-dev \
        libxcursor-dev \
        libxi-dev \
        libfuse-dev \
        build-essential \
        net-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ARG VMWARE_WORKSTATION_VERSION=16.2.5
ARG VMWARE_WORKSTATION_BUILD_NUMBER=20904516
RUN set -o pipefail \
    && apt-get update \
    && curl -fsSL https://download3.vmware.com/software/WKST-"${VMWARE_WORKSTATION_VERSION//\./}"-LX/VMware-Workstation-Full-"${VMWARE_WORKSTATION_VERSION}"-"${VMWARE_WORKSTATION_BUILD_NUMBER}".x86_64.bundle -o /tmp/VMWareWorkstation.bundle \
    && /bin/bash -x /tmp/VMWareWorkstation.bundle --console --required --eulas-agreed \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
