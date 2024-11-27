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
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make

if [ -f tmux ]; then
    echo "Build successful"
    cp tmux /app/dist
else
    echo "Build failed"
fi
