#!/bin/bash -eu

SRC=$(dirname $(readlink -f $0))
DEST=$(readlink -f .)

if [[ "$DEST" != */pi-gen ]]
then
  echo "$0 should be called from the RPi-Distro pi-gen folder"
  exit 1
fi

cp "$SRC/pi-gen-config" config
rm -rf stage2/EXPORT_NOOBS stage2/EXPORT_IMAGE export-image/01-user-rename/00-packages
mkdir -p stage_teslausb
touch stage_teslausb/EXPORT_IMAGE
cp stage2/prerun.sh stage_teslausb/prerun.sh
cp -r "$SRC/00-teslausb-tweaks" stage_teslausb

echo 'Build config set. Now use "./build.sh" or "./build-docker.sh" to build the TeslaUSB image.'


