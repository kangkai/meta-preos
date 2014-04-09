DESCRIPTION = "Mosquitto is an open source implementation of a server for \
			   version 3.1 of the MQTT protocol."

LICENSE = "BSD-4-Clause"
DEPENDS = "openssl"


PR = "r0"

inherit autotools update-rc.d

INHIBIT_PACKAGE_STRIP = "1"

CFLAGS += "-L${STAGING_LIBDIR}"

SRC_URI = "http://mosquitto.org/files/source/${BPN}-${PV}.tar.gz \
	   file://reconfig-install-prefix-to-usr.patch \
           file://init-mqtt \
           file://mosquitto.conf"

INITSCRIPT_NAME = "init-mqtt"

FILES_${PN} += "${libdir}/python2.7/*"

do_install_append() {
    install -d -m 0755 ${D}${sysconfdir}/init.d
    install -d -m 0755 ${D}${sysconfdir}/mosquitto/
    install -m 0755 ${WORKDIR}/init-mqtt ${D}${sysconfdir}/init.d/init-mqtt
    install -m 0755 ${WORKDIR}/mosquitto.conf ${D}${sysconfdir}/mosquitto/

    mv ${D}/usr/lib ${D}/usr/${baselib} || true
}

SRC_URI[md5sum] = "2f2870e965cf6f0b5df4ecaf2a0955d2"
SRC_URI[sha256sum] = "1ee649cb80e0bd0aed8476349aa4c15c667507e2fc69540f18e3a1c599ed85fd"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=89aa5ea5f32e4260d84c5d185ee3add4"

