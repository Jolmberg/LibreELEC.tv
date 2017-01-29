################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="opengl-mali"
PKG_VERSION="4412_r5p0_x11"
PKG_DEPENDS_TARGET="toolchain"
PKG_URL="http://people.piment-noir.org/~fraggle/download/odroid/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libXfixes libXrender libXcomposite libxcb"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}"
PKG_ARCH="arm"
PKG_LICENSE="nonfree"
PKG_SITE="http://www.arm.com/products/multimedia/mali-gpu/ultra-low-power/mali-400.php"
PKG_SECTION="graphics"
PKG_SHORTDESC="opengl-mali: OpenGL-ES and Mali driver for Mali 400 GPUs"
PKG_LONGDESC="opengl-mali: OpenGL-ES and Mali driver for Mali 400 GPUs"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
 : # nothing todo
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include
    cp -PR src/include/* $SYSROOT_PREFIX/usr/include

  # EGL pkgconfig definition is needed since Kodi Krypton
  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cat > $SYSROOT_PREFIX/usr/lib/pkgconfig/egl.pc <<\ \ \ \ EoF
prefix=/usr
exec_prefix=${prefix}
libdir=${prefix}/lib/
includedir=${prefix}/include

Name: EGL
Description: EGL
Version: @PKG_VERSION@
Requires:
Libs: -L${libdir} -lEGL
Cflags: -I${includedir}/EGL
    EoF
    sed -i "s/@PKG_VERSION@/$PKG_VERSION/" $SYSROOT_PREFIX/usr/lib/pkgconfig/egl.pc

  # cleanup packaged unused links
  rm -f libEGL.so.1
  rm -f libEGL.so.1.4
  rm -f libGLESv1_CM.so
  rm -f libGLESv1_CM.so.1
  rm -f libGLESv1_CM.so.1.1
  rm -f libGLESv2.so.2
  rm -f libGLESv2.so.2.0

  mkdir -p $SYSROOT_PREFIX/usr/lib
    cp -PR *.so* $SYSROOT_PREFIX/usr/lib
    ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libEGL.so
    ln -sf libMali.so $SYSROOT_PREFIX/usr/lib/libGLESv2.so

  mkdir -p $INSTALL/usr/lib
    cp -PR *.so* $INSTALL/usr/lib
    ln -sf libMali.so $INSTALL/usr/lib/libEGL.so
    ln -sf libMali.so $INSTALL/usr/lib/libGLESv2.so
}

