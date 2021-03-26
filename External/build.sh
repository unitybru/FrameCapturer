#!/bin/bash

echo 
echo "++++++++++++++++++++++++++++++++++++"
echo "Build FrameCapture dependencies"
echo "++++++++++++++++++++++++++++++++++++"

installdir=$(pwd)/install
tgzdir=$(pwd)



if false; then


if [[ -e ${installdir} ]]; then
    rm -rf ${installdir}
fi
mkdir -p ${installdir}

echo "------------------------------------"
echo "Build openexr 2.5.5"
echo "------------------------------------"
if [[ -e openexr-build ]]; then
    rm -rf openexr-build
fi
mkdir -p openexr-build
pushd openexr-build
cmake ../openexr/IlmBase -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}/openexr" \
    -DCMAKE_PREFIX_PATH="${installdir}/openexr" \
    -DNAMESPACE_VERSIONING=OFF \
    -DILMBASE_LIB_SUFFIX="" \
    -DBUILD_TESTING=OFF \
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
    -DBUILD_SHARED_LIBS=ON
cmake --build . --config Release
# To probe the file afterwards, use this
#xcrun -sdk iphoneos lipo -info libwebm.a
popd

echo "------------------------------------"
echo "Build libvpx 1.9.0"
echo "------------------------------------"
if [[ -e libvpx-build ]]; then
    rm -rf libvpx-build
fi
mkdir -p libvpx-build
pushd libvpx-build

../libvpx/configure --disable-examples --disable-tools --disable-docs --enable-vp8 --enable-vp9
make
make install
popd

echo "------------------------------------"
echo "Build libvorbis 1.3.7"
echo "------------------------------------"
if [[ -e libvorbis-build ]]; then
    rm -rf libvorbis-build
fi
mkdir -p libvorbis-build
pushd libvorbis-build

cmake ../libvorbis -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}/libvorbis" \
    -DCMAKE_PREFIX_PATH="${installdir}/libvorbis" \
    -DBUILD_SHARED_LIBS=OFF
cmake --build . --target install --config Release
popd

echo "------------------------------------"
echo "Build libopus 1.3.1"
echo "------------------------------------"
if [[ -e libopus-build ]]; then
    rm -rf libopus-build
fi
mkdir -p libopus-build
pushd libopus-build

cmake ../libopus -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}/libopus" \
    -DCMAKE_PREFIX_PATH="${installdir}/libopus" \
    -DBUILD_SHARED_LIBS=OFF
cmake --build . --target install --config Release
popd

echo "------------------------------------"
echo "Build libflac 1.3.3"
echo "------------------------------------"
if [[ -e libflac-build ]]; then
    rm -rf libflac-build
fi
mkdir -p libflac-build
pushd libflac-build

cmake ../libflac -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}/libflac" \
    -DCMAKE_PREFIX_PATH="${installdir}/libflac" \
    -DBUILD_SHARED_LIBS=OFF
cmake --build . --target install --config Release
popd

fi





echo "------------------------------------"
echo "Build libogg 1.3.4"
echo "------------------------------------"
if [[ -e libogg-build ]]; then
    rm -rf libogg-build
fi
mkdir -p libogg-build
pushd libogg-build

cmake ../libogg -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${installdir}/libogg" \
    -DCMAKE_PREFIX_PATH="${installdir}/libogg" \
    -DBUILD_SHARED_LIBS=OFF
cmake --build . --target install --config Release
popd
