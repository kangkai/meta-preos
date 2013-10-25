EXTRA_OECONF = "\
  --disable-fast-install \
  --disable-maintainer-mode \
  --disable-libtool-lock \
  --disable-osx \
  --disable-x11 \
  --disable-debug-support \
  --disable-gettid \
  --disable-network \
  --disable-devmem \
  --disable-vnc \
  --disable-sysfs \
  --disable-gif \
  --disable-jpeg \
  --disable-video4linux \
  --disable-video4linux2 \
  --with-gfxdrivers=none \
  --with-inputdrivers=none \
  --without-tests \
  --without-tools \
  --disable-svg \
  --disable-imlib2 \
  --disable-mng \
  --disable-linotype \
  --disable-pvr2d \
  --disable-pnm \
  --disable-mpeg2 \
  --disable-bmp \
  --disable-jpeg2000 \
  --enable-fbdev \
"

# For debugging directfb & apps
# EXTRA_OECONF += "\
#   --enable-trace \
# "

FILES_${PN}-dbg += "\
  ${libdir}/directfb-${RV}-pure/*/.debug/*.so \
  ${libdir}/directfb-${RV}-pure/*/*/.debug/*.so \
"

FILES_${PN}-dev += "\
  ${libdir}/directfb-${RV}-pure/systems/*.la \
  ${libdir}/directfb-${RV}-pure/inputdrivers/*.la \
  ${libdir}/directfb-${RV}-pure/interfaces/*/*.la \
  ${libdir}/directfb-${RV}-pure/wm/*.la \
"

FILES_${PN} += "\
  ${libdir}/directfb-${RV}-pure/systems/*.so \
  ${libdir}/directfb-${RV}-pure/inputdrivers/*.so \
  ${libdir}/directfb-${RV}-pure/interfaces/*/*.so \
  ${libdir}/directfb-${RV}-pure/wm/*.so \
"

# For debugging directfb & apps
# FILES_${PN} += "\
#   ${libdir}/nm-n.libfusion-1.6.so.0 \
#   ${libdir}/nm-n.libdirect-1.6.so.0 \
#   ${libdir}/nm-n.libdirectfb-1.6.so.0 \
# "
