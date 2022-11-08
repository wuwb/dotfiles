#!/usr/bin/env zsh

brew install gdb
# GDB enhanced features
mkdir -p ${XDG_CONFIG_HOME}/gdb/
wget -O ${XDG_CONFIG_HOME}/gdb/gdbinit-gef.py -q http://gef.blah.cat/py

if [[ $(_os) == 'macos' ]]; then
  # GDB codesign: https://sourceware.org/gdb/wiki/PermissionsDarwin
  bash <(curl -s https://raw.githubusercontent.com/conda-forge/gdb-feedstock/master/recipe/macos-codesign/macos-setup-codesign.sh)
  codesign --entitlements ${DOTTY_CONFIG_HOME}/dev/cc/gdb/gdb-entitlement.xml -fs gdb_codesign $(which gdb)
fi

mklink $DOTTY_CONFIG_HOME/dev/cc/gdb/.gdbinit ~/
