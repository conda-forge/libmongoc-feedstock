@echo on

cmake %CMAKE_ARGS% -S . -B build ^
    -G Ninja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DBUILD_SHARED_LIBS=ON ^
    -DENABLE_SHARED=ON ^
    -DENABLE_STATIC=OFF ^
    -DENABLE_TESTS=OFF ^
    -DENABLE_EXAMPLES=OFF ^
    -DUSE_SYSTEM_LIBBSON=ON ^
    -DENABLE_ZLIB=SYSTEM ^
    -DENABLE_ZSTD=AUTO ^
    -DENABLE_SNAPPY=AUTO ^
    -DENABLE_SSL=WINDOWS ^
    -DENABLE_SASL=SSPI
if errorlevel 1 exit 1

cmake --build build --config Release
if errorlevel 1 exit 1

cmake --install build --config Release
if errorlevel 1 exit 1
