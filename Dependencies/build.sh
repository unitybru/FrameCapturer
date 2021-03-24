#!/bin/bash

echo 
echo "++++++++++++++++++++++++++++++++++++"
echo "Build FrameCapture dependencies"
echo "++++++++++++++++++++++++++++++++++++"

installdir=$(pwd)/install
tgzdir=$(pwd)

if [[ -e ${installdir} ]]; then
    rm -rf ${installdir}
fi
mkdir -p ${installdir}

echo "------------------------------------"
echo "Build openexr 2.5.5"
echo "------------------------------------"
if [[ -e ilmbase-build ]]; then
    rm -rf ilmbase-build
fi
mkdir -p ilmbase-build
pushd ilmbase-build
cmake ../openexr/IlmBase -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}" \
    -DCMAKE_PREFIX_PATH="${installdir}" \
    -DNAMESPACE_VERSIONING=OFF \
    -DBUILD_SHARED_LIBS=OFF
cmake --build . --target install --config Release
popd

echo "------------------------------------"
echo "Build libwebm 1.0.0.27"
echo "------------------------------------"
if [[ -e libwebm-build ]]; then
    rm -rf libwebm-build
fi
mkdir -p libwebm-build
pushd libwebm-build

# Generate project files for platform
cmake ../libwebm -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}" \
    -DCMAKE_PREFIX_PATH="${installdir}" \
    -DBUILD_SHARED_LIBS=OFF
cmake --build . --config Release
# To probe the file afterwards, use this
#xcrun -sdk iphoneos lipo -info libwebm.a
popd