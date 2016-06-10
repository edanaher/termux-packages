TERMUX_PKG_HOMEPAGE=https://nixos.org/nix/
TERMUX_PKG_DESCRIPTION="Nix is a powerful package manager for Linux and other Unix systems that makes package management reliable and reproducible"
TERMUX_PKG_VERSION=1.11.2
TERMUX_PKG_SRCURL=https://nixos.org/releases/nix/nix-${TERMUX_PKG_VERSION}/nix-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_DEPENDS="openssl, perl, libbz2, libsqlite, libcurl, liblzma, libcrypt"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-store-dir=$TERMUX_PREFIX/nix"

#termux_step_post_extract_package () {
#  cp -ax /root/termux-packages/packages/nix-env/src/nix-1.11.2/* $TERMUX_PKG_SRCDIR
#  echo $TERMUX_PKG_SRCDIR
#}

termux_step_pre_configure () {
  # This seems to fail, but doesn't actually cause any problems, AFAICT
  yes | cpan DBD DBD::SQLite WWW::Curl || true
}

termux_step_post_configure () {
  make Makefile.config
  sed "/CXXFLAGS =/ s|$| -fPIE -lgnustl_shared|" Makefile.config -i
  local cxxflags=`cat Makefile.config | grep CXXFLAGS`
  sed "/CFLAGS =/ s|.*|${cxxflags/CXXFLAGS/CFLAGS}|" Makefile.config -i
  sed "/GLOBAL_LDFLAGS/ s|$| -lgnustl_shared|" mk/libraries.mk -i
  sed "/GLOBAL_LDFLAGS/ s|$| -pie -lgnustl_shared|" mk/programs.mk -i
}
TERMUX_DEBUG=1
