# buildChromium
This project is a guideline about how to build chromium with ninja and TSAN v2.0 in order to get a data race report to do further analysis

This project can be recommended for building on Ubuntu 12.04
## Install the git instruction on your operating system
```
sudo apt-get install git-core
```

## Download chromium & Uncompressing chromium tarball
* Download chromium directly
Download the source code of Chromium from the website
```
http://chromium-browser-source.commondatastorage.googleapis.com/chromium_tarball.html
```
* Uncompressing the downloaded file
You can uncompressing the file by some tools on your operating systems or utilize the instruction directly.
```
tar –xzvf chromium.r197479.tgz
```

## Build chromium with ninja
* Use following git instructions to download the depot_tools for building chromium
```
git init
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
```
* After finish installing the depot_tools, you need to move the whole file to the directory of “src” (“src” is belong to your chromium project)

*	Modify the ```~/.bashrc``` and Add the depot_tools to your PATH
```
export PATH=$PATH:path/to/depot_tools
```
* Install all of the library dependencies under the directory of chromium
```
sudo ./src/build/install-build-deps.sh 
```
* Configure gclient under the directory of chromium
```
gclient config http://src.chromium.org/svn/trunk/src
```
*	Do the runhooks configuration under the directory of chromium and configure ninja
```
export GYP_GENERATORS=ninja
gclient runhooks
```
*	Do the updating configuration under the directory of “src”
```
gclient sync –force
```
*	Build chromium with ninja under the directory of “src”
```
ninja -C out/Debug chrome    ---Debug mode
ninja -C out/Release chrome   ---Release mode
```




