#!/bin/bash
# A build.sh template

if [ "$BUILD_CONTAINER" != "true" ]; then
    echo "This should be run inside a build container"
    exit 1
fi

echo "Inside build container"

set -e

mkdir -p /app/build     # Somewhere to put build artifacts
mkdir -p /app/build/log # Somewhere to put build logs
mkdir -p /app/dist      # Somewhere to put the release files

cd /usr/src
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
#make test
make install DESTDIR=/app/dist

