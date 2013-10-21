#!/bin/sh

echo "****************************"
echo "Pre-OS v$(cat /etc/VERSION)"
echo "****************************"

if [ "x$0" = x/init ]; then
	__sysinit=true
else
	__sysinit=false
fi


# system environment setup
if $__sysinit; then
	if [ ! -e /proc/mounts ] ; then
		[ -d /proc ] || mkdir /proc
		mount -t proc proc /proc

		[ -d /sys ] || mkdir /sys
		mount -t sysfs sysfs /sys

		[ -d /tmp ] || mkdir /tmp
		mount -t tmpfs -o size=8m tmpfs /tmp
		
		[ -d /var ] || mkdir /var
		mkdir -p -m a+rwx /var/log /var/run /var/lock /var/lib
		
		[ -d /dev ] || mkdir /dev
		mount -t devtmpfs devtmpfs /dev
    fi
fi

PATH=/sbin:/bin:/usr/sbin:/usr/bin
DFBARGS=module-dir=/lib/directfb-1.4-5-pure

PS1='preos \w> '	# if user invokes a shell
export PATH PS1 DFBARGS

mkdir /dev/block
ln -s /dev/mmcblk* /dev/block/

if [ ! -e /dev/android_adb ] ; then
    if [ -e /dev/samsung_sdb ]; then
	ln -sf /dev/samsung_sdb /dev/android_adb
    elif [ -e /dev/tizen_sdb ]; then
	ln -sf /dev/tizen_sdb /dev/android_adb
    else
	# How to show in tboot UI
	echo "Error: Can't find USB adb/sdb device."
    fi
fi

echo 0 > /proc/sys/kernel/printk
echo on > /sys/devices/pci0000\:00/0000\:00\:05.1/power/control

# enable adb and usb0
usbmode=/sys/class/usb_mode/usb0
#usbmode=/sys/class/android_usb/android0

echo 0 > ${usbmode}/enable
echo 8087 > ${usbmode}/idVendor
echo D002 > ${usbmode}/idProduct
echo sdb,rndis > ${usbmode}/functions
echo 1 > ${usbmode}/enable

# differ system from system, the usbnet name might be rndis0 or usb0
/sbin/ifconfig rndis0 192.168.111.1
/sbin/ifconfig usb0 192.168.111.1

# set backlight to max
echo "$(cat /sys/class/backlight/psb-bl/max_brightness)" > /sys/class/backlight/psb-bl/brightness

# watchdogd
/sbin/watchdogd &

# tboot service
/sbin/tboot &

################ telnetd debug #####################
# mkdir /dev/pts
# mount -t devpts none /dev/pts
# /tools/busybox telnetd -l /bin/bash &
####################################################

# drop into shell
/bin/sh
