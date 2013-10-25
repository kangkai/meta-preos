DESCRIPTION = "The libc based fastboot protocol server implementation"
SECTION = "utils"
LICENSE = "Apache-2.0"
DEPENDS = "directfb"

SRC_URI = "git://github.com/kangkai/tboot;branch=master"
#SRC_URI = "git://kai@kai-gentoo.bj.intel.com//home/kai/work/tizen/preos/tboot;branch=master;protocol=ssh"

SRCREV = "ec89dc39ec099a5f154989a57628961abd13937f"

S = "${WORKDIR}/git"

LIC_FILES_CHKSUM = "file://NOTICE;md5=fff4c933bdc5a1f920e3630b59eb6602"

inherit autotools

BBCLASSEXTEND = "native"
