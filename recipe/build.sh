#!/bin/bash
set -euxo pipefail

cmake ${CMAKE_ARGS} -S . -B build \
      -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH="${PREFIX}" \
      -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DBUILD_SHARED_LIBS=ON \
      -DENABLE_SHARED=ON \
      -DENABLE_STATIC=OFF \
      -DENABLE_TESTS=OFF \
      -DENABLE_EXAMPLES=OFF \
      -DUSE_SYSTEM_LIBBSON=ON \
      -DENABLE_ZLIB=SYSTEM \
      -DENABLE_ZSTD=ON \
      -DENABLE_SNAPPY=ON \
      -DENABLE_SSL=OPENSSL \
      -DENABLE_SASL=CYRUS

cmake --build build --config Release
cmake --install build --config Release
