#!/bin/sh

upgrade() {
  SS_MERLIN_HOME=/opt/share/ss-merlin

  rm -f ${SS_MERLIN_HOME}/tools/do_upgrade.sh

  wget https://raw.githubusercontent.com/Acris/shadowsocks-asuswrt-merlin/hnd/tools/do_upgrade.sh -O ${SS_MERLIN_HOME}/tools/do_upgrade.sh

  sh ${SS_MERLIN_HOME}/tools/do_upgrade.sh
}

upgrade
