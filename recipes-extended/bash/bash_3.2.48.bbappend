PACKAGES =+ "${PN}-preos"
FILES_${PN}-preos = "${base_bindir}/bash* \
		    "

ALTERNATIVE_${PN}-preos = "sh"
ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
ALTERNATIVE_PRIORITY = "100"
