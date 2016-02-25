#!/bin/bash

# Copyright (c) 2016,  Regents of Clark YAN 
# Related github website https://github.com/ClarkYan/buildChromium 
# All rights reserved.

# Enter the directory of Desktop
cd Desktop

# Install all of the library dependencies under the directory of chromium
sudo ./src/build/install-build-deps.sh

# Configure gclient under the directory of chromium
gclient config http://src.chromium.org/svn/trunk/src

# Do the runhooks configuration under the directory of chromium and configure ninja
export GYP_GENERATORS=ninja
gclient runhooks

# Enter the directory of src
cd src

# Do the updating configuration for gclient
gclient sync --force

# Build chromium with ninja (---Debug mode or ---Release mode)
# ninja -C out/Debug chrome
ninja -C out/Release chrome

# Run the chromium browser
# Build the base_unittests first 
ninja -C out/Release base_unittests

# Run the base_unittests as no-sandbox mode
out/Release/base_unittests --no-sandbox 2>&1 | tee log

# Set the condition of TSAN option 
TSAN_OPTIONS="atexit_sleep_ms=200 flush_memory_ms=2000 $TSAN_OPTIONS"

# Run the chrome object on the current operating system
out/Release/chrome --no-sandbox  2>&1 | tee log



