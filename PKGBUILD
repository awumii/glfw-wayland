# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>

_pkgbase=glfw
pkgname=glfw-wayland-git
pkgver=3.4.r53.g8e15281d
pkgrel=1
pkgdesc="Free, open source, portable framework for OpenGL application development (git version)"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://www.glfw.org/"
license=('Zlib')
depends=('libgl' 'libxkbcommon')
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxinerama' 'git' 'ninja')
conflicts=('glfw' 'glfw-x11' 'glfw-wayland')
provides=('glfw' 'glfw-x11' 'glfw-wayland')
replaces=('glfw-x11-git' 'glfw-wayland-git')
optdepends=('libgl: for OpenGL support'
            'opengl-driver: for OpenGL support'
            'vulkan-icd-loader: for Vulkan support'
            'vulkan-driver: for Vulkan support')
source=(
"$_pkgbase::git+https://github.com/glfw/glfw"
"0001-Key-Modifiers-Fix.patch"
"0002-Implement-glfwSetCursorPosWayland.patch"
"0003-Fix-Window-size-on-unset-fullscreen.patch"
"0004-Fix-crash-on-WindowPos.patch"
"0005-Implement-glfwSetWindowIcon.patch"
)
sha256sums=(
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd glfw

  echo "Applying patch 0001..."
  git apply -3 ../0001-Key-Modifiers-Fix.patch

  echo "Applying patch 0002..."
  git apply -3 ../0002-Implement-glfwSetCursorPosWayland.patch

  echo "Applying patch 0003..."
  git apply -3 ../0003-Fix-Window-size-on-unset-fullscreen.patch

  echo "Applying patch 0004..."
  git apply -3 ../0004-Fix-crash-on-WindowPos.patch

  echo "Applying patch 0005..."
  git apply -3 ../0005-Implement-glfwSetWindowIcon.patch
}


build() {
  mkdir -p $_pkgbase/build
  cd $_pkgbase/build
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
}

package() {
  cd $_pkgbase/build
  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
