################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2009-2016
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="odroid-u2-bootloader"
PKG_VERSION="33e05ff"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="other"
PKG_SITE="http://hardkernel.com"
#FIXME: upload source tarball to sources.libreelec.tv
PKG_URL="http://people.piment-noir.org/~fraggle/download/odroid/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_TARGET_DEPENDS_TARGET="toolchain"
PKG_SECTION=""
PKG_SHORTDESC="Hardkernel binary boot blobs"
PKG_LONGDESC="Hardkernel binary boot blobs"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # Do nothing
}

makeinstall_target() {
  install -D -m 0644 bl1.bin $INSTALL/usr/share/bootloader/bl1
  install -D -m 0644 bl2.bin $INSTALL/usr/share/bootloader/bl2
  install -D -m 0644 tzsw.bin $INSTALL/usr/share/bootloader/tzsw
}

