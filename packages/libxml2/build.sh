TERMUX_PKG_HOMEPAGE=http://www.xmlsoft.org
TERMUX_PKG_DESCRIPTION="Library for parsing XML documents"
TERMUX_PKG_VERSION=2.9.4
TERMUX_PKG_SRCURL=ftp://xmlsoft.org/libxml2/libxml2-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-python"
TERMUX_PKG_RM_AFTER_INSTALL="share/gtk-doc"
TERMUX_PKG_INCLUDE_IN_DEVPACKAGE="bin/xml2-config share/man/man1/xml2-config.1 lib/cmake lib/xml2Conf.sh"
TERMUX_PKG_DEPENDS="liblzma"
