PACKAGES =+ "${PN}-preos"
FILES_${PN}-preos = "${base_bindir}/ps* \
		     ${base_libdir}/libproc* \
		    "
ALTERNATIVE_${PN}-preos = "ps"
