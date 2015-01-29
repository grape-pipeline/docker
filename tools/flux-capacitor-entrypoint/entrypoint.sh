#!/bin/bash
set -e
if [ "$1" = 'grape-quantify' ]; then
  shift
  exec flux-capacitor "$@"
fi

if [ "$@" = "" ];then
  exec bash
else
  exec "$@"
fi
