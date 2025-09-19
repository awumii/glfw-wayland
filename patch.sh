#!/bin/sh
git clone https://github.com/glfw/glfw
cp *.patch glfw
cd glfw

for file in *.patch; do
    echo "Applying patch: $file"
        if ! git apply -3 "$file"; then
        echo "Failed to apply $file"
        exit 1
    fi
done

mkdir build
cd build

cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -DGLFW_BUILD_WAYLAND=ON \
    -Wno-dev \
    -G Ninja \
    ..
ninja
