#!/bin/bash

# Copyright (c) 2016,  Regents of Clark YAN 
# Related github website https://github.com/ClarkYan/buildChromium 
# All rights reserved.

# Enter the directory of Desktop
cd Desktop

# Install the git instruction on your operating system
sudo apt-get install git-core

# You need to install a tool wget for downloading first
sudo apt-get install wget

# Download chromium directly Download the source code of Chromium from the website
wget http://chromium-browser-source.commondatastorage.googleapis.com/chromium_tarball.html

# Uncompressing the downloaded file You can uncompressing the file by some tools on your operating systems or utilize the instruction directly
tar -xzvf chromium.r197479.tgz

# Enter the directory of the chromium project
cd chromium

# Use following git instructions to download the depot_tools for building chromium
git init
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git


 
