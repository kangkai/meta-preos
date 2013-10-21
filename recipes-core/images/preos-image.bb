# Pre-OS image, it's in initramfs format.

DESCRIPTION = "Pre-OS image, used to run Pre-OS maintanance mode. It's in \
Minimal RAM-based Initial Root Filesystem (initramfs) format. The kernel \
includes the initramfs, and finds the first 'init' and hand over control to \
it."

IMAGE_INSTALL = "bash-preos \
	         bzip2-preos \
		 gzip-preos \
		 e2fsprogs-preos \
		 e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs \
		 grep \
		 kexec \
		 procps-preos \
		 util-linux-preos \
		 util-linux-mount util-linux-umount \
		 util-linux-fdisk util-linux-sfdisk util-linux-losetup \
	         coreutils-preos \
		 net-tools-preos \
		 directfb \
	         base-passwd \
		 initramfs-boot"

# Packages installed for development and test purpose
IMAGE_INSTALL += ""

# Do not pollute the initrd image with rootfs features
IMAGE_FEATURES = ""

# Features added for development and test purpose
# IMAGE_FEATURES += "package-management"

export IMAGE_BASENAME = "preos-image"
IMAGE_LINGUAS = ""

LICENSE = "MIT"

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
inherit core-image

IMAGE_ROOTFS_SIZE = "8192"

BAD_RECOMMENDATIONS += "busybox-syslog"
