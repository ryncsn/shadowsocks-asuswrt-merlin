#!/bin/ash

upgrade() {
  SS_MERLIN_HOME=/opt/share/ss-merlin

  # Switch to master branch
  cd ${SS_MERLIN_HOME} || exit
  if [[ -f ${SS_MERLIN_HOME}/etc/ss-merlin.conf ]]; then
    cp -a ${SS_MERLIN_HOME}/etc/ss-merlin.conf /tmp/ss-merlin/ss-merlin.conf
  fi
  if [[ -f ${SS_MERLIN_HOME}/etc/shadowsocks/config.json ]]; then
    cp -a ${SS_MERLIN_HOME}/etc/shadowsocks/config.json /tmp/ss-merlin/shadowsocks/config.json
  fi
  git checkout master
  if [[ -f /tmp/ss-merlin/shadowsocks/config.json ]]; then
    cp -a /tmp/ss-merlin/ss-merlin.conf ${SS_MERLIN_HOME}/etc/ss-merlin.conf
  fi
  if [[ -f /tmp/ss-merlin/shadowsocks/config.json ]]; then
    cp -a /tmp/ss-merlin/shadowsocks/config.json ${SS_MERLIN_HOME}/etc/shadowsocks/config.json
  fi

  cd ${SS_MERLIN_HOME} || exit
  git checkout bin/*
  git checkout scripts/*.sh
  git checkout tools/*.sh

  rm -f ${SS_MERLIN_HOME}/tools/do_upgrade.sh

  wget https://cdn.jsdelivr.net/gh/Acris/shadowsocks-asuswrt-merlin@master/tools/do_upgrade.sh -O ${SS_MERLIN_HOME}/tools/do_upgrade.sh

  chmod +x ${SS_MERLIN_HOME}/tools/do_upgrade.sh

  ${SS_MERLIN_HOME}/tools/do_upgrade.sh
}

upgrade
