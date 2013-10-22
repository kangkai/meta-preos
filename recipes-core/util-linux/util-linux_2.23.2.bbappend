PACKAGES =+ "${PN}-preos"
FILES_${PN}-preos = "${base_bindir}/dmesg* \
		    "
ALTERNATIVE_${PN}-preos = "dmesg"
