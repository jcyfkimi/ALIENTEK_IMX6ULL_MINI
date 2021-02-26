TOPDIR = ${shell pwd}

ifndef PROJECT_ROOT
	$(error You must first source the BSP environment: ". ./setenv")
endif

INSTALL_DIRS = src/bootloader src/kernel/linux src/kmods src/sysapps src/rootfs
CLEAN_DIRS = src/bootloader src/kernel/linux src/kmods src/sysapps src/rootfs

all: bootloader kernel kmods sysapps rootfs FW

.PHONY: bootloader kernel kmods sysapps rootfs FW

bootloader:
	@(if [ ! -f $(PROJECT_ROOT)/src/bootloader/u-boot/.config ]; then \
		$(MAKE) -C src/bootloader/u-boot mx6ull_alientek_emmc_defconfig; \
	fi)
	$(MAKE) -C src/$@
	cp $(PROJECT_ROOT)/src/bootloader/u-boot/u-boot.imx $(PROJECT_IMG)/loader

kernel:
	@(if [ ! -f $(PROJECT_ROOT)/src/kernel/linux/.config ]; then \
		$(MAKE) -C src/kernel/linux imx_alientek_emmc_defconfig; \
	fi)
	$(MAKE) -C src/kernel/linux
	$(MAKE) -C src/kernel/linux INSTALL_MOD_PATH=$(PROJECT_INSTALL) modules
	$(MAKE) -C src/kernel/linux INSTALL_MOD_PATH=$(PROJECT_INSTALL) modules_install
	cp $(PROJECT_ROOT)/src/kernel/linux/arch/arm/boot/zImage $(PROJECT_IMG)/kernel
	cp $(PROJECT_ROOT)/src/kernel/linux/arch/arm/boot/dts/imx6ull-alientek-emmc.dtb $(PROJECT_IMG)/dtb

kmods:
	$(MAKE) -C src/$@

sysapps:
	$(MAKE) -C src/$@

rootfs:
	$(MAKE) -C src/$@

FW:
	@echo "Building Firmware Image"
	@rm -rf $(PROJECT_ROOT)/FW/loader $(PROJECT_ROOT)/FW/kernel $(PROJECT_ROOT)/dtb $(PROJECT_ROOT)/filesystem
	@ln -sf $(PROJECT_ROOT)/img/loader $(PROJECT_ROOT)/FW/loader
	@ln -sf $(PROJECT_ROOT)/img/kernel $(PROJECT_ROOT)/FW/kernel
	@ln -sf $(PROJECT_ROOT)/img/dtb $(PROJECT_ROOT)/FW/dtb
	@ln -sf $(PROJECT_ROOT)/img/fs.tar.bz2 $(PROJECT_ROOT)/FW/filesystem
#	@cd $(PROJECT_ROOT)/FW; $(PROJECT_ROOT)/FW/combine-image.sh

.PHONY: clean cleanall
clean:
	@for i in `echo $(CLEAN_DIRS)`; do \
		$(MAKE) -C $$i $@; \
	done

cleanall: clean
	@echo -e "\n\n CleanAll.............\n\n"


