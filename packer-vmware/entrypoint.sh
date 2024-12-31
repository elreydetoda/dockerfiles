#!/usr/bin/env bash

# https://elrey.casa/bash/scripting/harden
set -${-//[sc]/}eu${DEBUG:+xv}o pipefail

function ubuntu_prep(){
  # installing current running kernel stuff
  apt-get update
  apt-get install -y "linux-headers-$(uname -r)" "linux-image-$(uname -r)"
}

function vmware_prep(){
  echo "Setting up VMWare"
  /usr/bin/vmware-modconfig --console --install-all
  /etc/init.d/vmware start
}

function main(){
  VMWARE_SN="${VMWARE_LIC_KEY:-}"
  PREP_ONLY="${PREP_ONLY:-}"

  apt list --installed 2>/dev/null | grep -q linux-headers || ubuntu_prep
  (
    [[ -x "/usr/bin/vmware" ]] &&
    lsmod | grep -q 'vmmon' &&
    lsmod | grep -q 'vmnet'
  ) || vmware_prep
  [[ -n "${VMWARE_SN}" ]] && /usr/lib/vmware/bin/vmware-vmx --new-sn "${VMWARE_SN}"
  /usr/bin/vmware-networks --start
  [[ -n "${PREP_ONLY}" ]] || ( packer init "${BUILD_FOLDER}" && packer "${@}" "${BUILD_FOLDER}" )
}

# https://elrey.casa/bash/scripting/main
if [[ "${0}" = "${BASH_SOURCE[0]:-bash}" ]] ; then
  main "${@}"
fi
