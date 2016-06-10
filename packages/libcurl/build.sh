TERMUX_PKG_HOMEPAGE=http://curl.haxx.se/
TERMUX_PKG_DESCRIPTION="Easy-to-use client-side URL transfer library"
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_VERSION=7.49.0
TERMUX_PKG_SRCURL=http://curl.askapache.com/download/curl-${TERMUX_PKG_VERSION}.tar.bz2
export TERMUX_CA_BUNDLE=$TERMUX_PREFIX/etc/tls/cert.pem
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-ssl --without-libidn --with-ca-bundle=$TERMUX_CA_BUNDLE"
