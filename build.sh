#!/bin/bash

clear
echo "++++++++++++++++++++++++++++++++++++"
echo "Build FrameCapture and dependencies"
echo "++++++++++++++++++++++++++++++++++++"
sw_vers # Print OS info

export MAKEFLAGS="-j12"

# macOS: build for Silicon and x64
if [ "$(uname)" == "Darwin" ]; then
   #export CXXFLAGS="${CXXFLAGS} -arch x86_64 -arch arm64"
   #export CFLAGS="${CFLAGS} -arch x86_64 -arch arm64"
   echo "No crossplatform build yet because of libwebm issues"
fi

echo "************************************"
echo "Dependencies"
echo "************************************"
pushd Dependencies
./build.sh
popd # Dependencies

echo "************************************"
echo "FrameCapture"
echo "************************************"
if [[ -e build ]]; then
    rm -rf build
fi

mkdir build
pushd build
cmake ../Plugin
popd # build