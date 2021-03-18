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