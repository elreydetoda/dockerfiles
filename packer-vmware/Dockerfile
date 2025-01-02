ARG PACKER_VERSION=1.11.2
ARG UBUNTU_VERSION=24.04
FROM "docker.io/hashicorp/packer:light-${PACKER_VERSION}" as packer_bin
FROM docker.io/ubuntu:${UBUNTU_VERSION}
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
        libxcb-shm0 \
        libxcb-render0 \
        libxcb-xinerama0 \
        libxml2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# last 3 packages were added for 17.6.2
ARG VMWARE_WORKSTATION_VERSION=17.6.2
ARG VMWARE_WORKSTATION_BUILD_NUMBER=24409262
# found link here: https://community.broadcom.com/vmware-cloud-foundation/question/using-vmware-workstation-1752-on-ubuntu-in-cicd-pipelines-fails
RUN set -o pipefail \
    && apt-get update \
    && curl -H 'user-agent: mozilla' -fsSL "https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${VMWARE_WORKSTATION_VERSION}/${VMWARE_WORKSTATION_BUILD_NUMBER}/linux/core/VMware-Workstation-${VMWARE_WORKSTATION_VERSION}-${VMWARE_WORKSTATION_BUILD_NUMBER}.x86_64.bundle.tar" -o /tmp/VMWareWorkstation.bundle.tar && tar -C /tmp/ -xvf /tmp/VMWareWorkstation.bundle.tar \
    && /bin/bash -x "/tmp/VMware-Workstation-${VMWARE_WORKSTATION_VERSION}-${VMWARE_WORKSTATION_BUILD_NUMBER}.x86_64.bundle" --console --required --eulas-agreed \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
