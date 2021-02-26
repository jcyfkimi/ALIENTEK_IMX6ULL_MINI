BUSYBOX_DIR = $(PROJECT_ROOT)/src/sysapps/open_source/busybox
TARGET = busybox-1.29.0

define build_busybox
$(MAKE) ARCH=arm CONFIG_PREFIX=$(PROJECT_ROOT)/img/fs/shadow_root/ \
	KBUILD_SRC=$(BUSYBOX_DIR)/$(TARGET) \
	-f $(BUSYBOX_DIR)/$(TARGET)/Makefile $(1)
endef

all: build install

install:
	mkdir -p $(PROJECT_ROOT)/img/fs/shadow_root/bin
	mkdir -p $(PROJECT_ROOT)/img/fs/shadow_root/sbin
	mkdir -p $(PROJECT_ROOT)/img/fs/shadow_root/usr
	cd $(BUSYBOX_DIR)/out && $(call build_busybox, install) && cd -

build:
	cp $(BUSYBOX_DIR)/$(TARGET)/configs/alientek_imx6ull_mini_config $(BUSYBOX_DIR)/out/.config
	cd $(BUSYBOX_DIR)/out && $(call build_busybox) && cd -


.PHONY: all install build clean cleanall distclean

clean:
	make -C busybox-1.29.0 distclean
	@rm -rf $(BUSYBOX_DIR)/out/*


cleanall distclean:
	make -C busybox-1.29.0 distclean
	@rm -rf $(BUSYBOX_DIR)/out/*

