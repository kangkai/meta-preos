meta-preos
==========

A Yocto layer to generate Pre-OS initrd image


How-to use
-----------

Put meta-preos in your yocto/poky dir, as below:

 $ tree -L 1
 .
 ├── bitbake
 ├── documentation
 ├── LICENSE
 ├── meta
 ├── meta-hob
 ├── meta-preos
 ├── meta-skeleton
 ├── meta-yocto
 ├── meta-yocto-bsp
 ├── oe-init-build-env
 ├── oe-init-build-env-memres
 ├── README
 ├── README.hardware
 └── scripts
 
 9 directories, 5 files

Then you can use below command to build out Pre-OS initramfs image:

 $ bitbake preos-image

For detailed Yocto usage guide, please refer the official site.
