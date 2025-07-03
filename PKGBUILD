# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>

_pkgbase=glfw
pkgname=glfw-wayland-git
pkgver=3.4.r23.ge7ea71be
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
"0002-Fix-duplicate-pointer-scroll-events.patch"
"0003-Implement-glfwSetCursorPosWayland.patch"
"0004-Fix-Window-size-on-unset-fullscreen.patch"
"0005-Implement-glfwSetWindowIcon.patch"
"0006-Fix-crash-on-WindowPos.patch"
)
sha256sums=(
'SKIP'
'80520e329637397a9d14deb2f68219e96b207380100cef172be4ad757812c04a'
'f96a16af2f9288db034c4cc2d2dc362f889f3b45b7529de6f61927e14a15c467'
'e7b615a4acc5cd9a4e1182c3fc79a566ac0f4c8862f22a951b88d7ae4f200dd6'
'e840ca8529157452e1c574d8e0f4e9eae37e8c0c5d1080312dc6dba58a28ee57'
'671629a0263e3922707e3641ac65ac320445ecdc3535843a3ba4eaecfd8bcb54'
'9d857addab03f3f1815051386f30e557f4e5e992cb8082f4d816bc3d696d16e7'
)

pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd glfw

  git apply -3 ../0001-Key-Modifiers-Fix.patch
  git apply -3 ../0002-Fix-duplicate-pointer-scroll-events.patch
  git apply -3 ../0003-Implement-glfwSetCursorPosWayland.patch
  git apply -3 ../0004-Fix-Window-size-on-unset-fullscreen.patch
  git apply -3 ../0005-Implement-glfwSetWindowIcon.patch
  git apply -3 ../0006-Fix-crash-on-WindowPos.patch
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
