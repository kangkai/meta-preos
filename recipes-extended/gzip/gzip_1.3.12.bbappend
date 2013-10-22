PACKAGES =+ "${PN}-preos"
FILES_${PN}-preos = "${base_bindir}/gzip* \
		     ${base_bindir}/gunzip* \
		    "
ALTERNATIVE_${PN}-preos = "gzip gunzip"
