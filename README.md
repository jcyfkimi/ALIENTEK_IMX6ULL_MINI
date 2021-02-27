# ALIENTEK_IMX6ULL_MINI

### Requirements

	sudo apt-get install lzop git android-tools-adb android-tools-fastboot gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping libsdl1.2-dev xterm gdb-multiarch
---
### How to build

	$ git clone https://github.com/jcyfkimi/ALIENTEK_IMX6ULL_MINI.git
	$ cd ALIENTEK_IMX6ULL_MINI
	$ . ./setenv
	$ make all
	
---
## Image locations
All images will located at [WORKSPACE]/ALIENTEK_IMX6ULL_MINI/img/, the mapping is as below:


|File|Image|
|----|-----|
|dtb |imx6ull-alientek-emmc.dtb|
|kernel|zImage|
|loader|u-boot.imx|
|fs.tar.bz2| rootfs.tar.bz2|

or you can find the images from the original path:

	[WORKSPACE]/ALIENTEK_IMX6ULL_MINI/src/bootloader/u-boot/u-boot.imx
	[WORKSPACE]/ALIENTEK_IMX6ULL_MINI/src/kernel/linux/arch/arm/boot/zImage
	[WORKSPACE]/ALIENTEK_IMX6ULL_MINI/src/kernel/linux/arch/arm/boot/dts/imx6ull-alientek-emmc.dtb
	[WORKSPACE]/ALIENTEK_IMX6ULL_MINI/img/fs/root ----> You will need to tar it.
	
	


