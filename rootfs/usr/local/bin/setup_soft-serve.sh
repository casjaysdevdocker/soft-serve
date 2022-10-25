#!/usr/bin/env bash
# shellcheck shell=bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202210251751-git
# @@Author           :  Jason Hempstead
# @@Contact          :  jason@casjaysdev.com
# @@License          :  WTFPL
# @@ReadME           :  setup_soft-serve.sh --help
# @@Copyright        :  Copyright: (c) 2022 Jason Hempstead, Casjays Developments
# @@Created          :  Tuesday, Oct 25, 2022 17:51 EDT
# @@File             :  setup_soft-serve.sh
# @@Description      :
# @@Changelog        :  New script
# @@TODO             :  Better documentation
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[ -n "$DEBUG" ] && set -x
OS_ARCH="$(uname -m)"
SOFT_SERVE_VERSION="${SOFT_SERVE_VERSION:-0.4.0}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ "$OS_ARCH" = "aarch64" ]; then
  FILE="/tmp/soft-serve.${OS_ARCH}tar.gz"
  URL="https://github.com/charmbracelet/soft-serve/releases/latest/soft-serve_${SOFT_SERVE_VERSION}_linux_arm64.tar.gz"
elif [ "$OS_ARCH" = "x86_64" ]; then
  FILE="/tmp/soft-serve.${OS_ARCH}tar.gz"
  URL="https://github.com/charmbracelet/soft-serve/releases/download/v0.4.0/soft-serve_${SOFT_SERVE_VERSION}_linux_x86_64.tar.gz"
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Main application
cd /tmp || exit
curl -q -LSsf "$URL" -o "$FILE"
if [ -f "$FILE" ]; then
  tar xfz "$FILE" && [ -f "/tmp/soft" ] && mv -f "/tmp/soft" "/usr/local/bin/soft" || exit 10
else
  exitCode=10
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# End application
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# lets exit with code
exit ${exitCode:-$?}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# end
