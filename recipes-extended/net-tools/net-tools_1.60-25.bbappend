PACKAGES =+ "${PN}-preos"
FILES_${PN}-preos = "${base_sbindir}/ifconfig* \
		    "
ALTERNATIVE_${PN}-preos = "ifconfig"
