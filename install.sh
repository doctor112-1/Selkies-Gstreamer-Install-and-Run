#!/bin/sh
sudo apt update
sudo apt-get install -y openbox
sudo apt-get install -y xinit
sudo apt-get update && sudo apt-get install --no-install-recommends -y jq tar gzip ca-certificates curl libpulse0 libegl1 libgl1 libopengl0 libgles1 libgles2 libglvnd0 libglx0 wayland-protocols libwayland-dev libwayland-egl1 x11-utils x11-xkb-utils x11-xserver-utils xserver-xorg-core libx11-xcb1 libxcb-dri3-0 libxkbcommon0 libxdamage1 libxfixes3 libxv1 libxtst6 libxext6 xvfb
export SELKIES_VERSION="$(curl -fsSL "https://api.github.com/repos/selkies-project/selkies-gstreamer/releases/latest" | jq -r '.tag_name' | sed 's/[^0-9\.\-]*//g')"
cd ~ && curl -fsSL "https://github.com/selkies-project/selkies-gstreamer/releases/download/v${SELKIES_VERSION}/selkies-gstreamer-portable-v${SELKIES_VERSION}_amd64.tar.gz" | tar -xzf -
export DISPLAY="${DISPLAY:-:0}"
export PIPEWIRE_LATENCY="32/48000"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
export PIPEWIRE_RUNTIME_DIR="${PIPEWIRE_RUNTIME_DIR:-${XDG_RUNTIME_DIR:-/tmp}}"
export PULSE_RUNTIME_PATH="${PULSE_RUNTIME_PATH:-${XDG_RUNTIME_DIR:-/tmp}/pulse}"
export PULSE_SERVER="${PULSE_SERVER:-unix:${PULSE_RUNTIME_PATH:-${XDG_RUNTIME_DIR:-/tmp}/pulse}/native}"
