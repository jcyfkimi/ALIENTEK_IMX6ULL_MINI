
ROOT_DIR=$(PROJECT_ROOT)/img/fs/root

ROOT_IMAGE=fs.img


all: fs-image install

fs-image: _rootfs
	@rm -rf $(ROOT_IMAGE)
	tar -cjf $(ROOT_DIR) $(ROOT_IMAGE)

_rootfs:
	@rm -rf $(ROOT_DIR)
	install -m 755 -d $(ROOT_DIR)
	cp -aR etc $(ROOT_DIR)
	cp -aR $(PROJECT_ROOT)/img/fs/shadow_root/* $(ROOT_DIR)
	
	install -m 755 -d $(ROOT_DIR)/dev
	install -m 755 -d $(ROOT_DIR)/sys
	install -m 755 -d $(ROOT_DIR)/proc
	install -m 755 -d $(ROOT_DIR)/mnt
	install -m 755 -d $(ROOT_DIR)/root
	install -m 755 -d $(ROOT_DIR)/tmp
	install -m 755 -d $(ROOT_DIR)/lib
	install -m 755 -d $(ROOT_DIR)/usr/lib

	# Copy libs from toolchain path
	@cp -a $(SOURCETOOLCHAINDIR)/arm-linux-gnueabihf/libc/lib/*so* $(ROOT_DIR)/lib/
	@cp -a $(SOURCETOOLCHAINDIR)/arm-linux-gnueabihf/libc/lib/*.a $(ROOT_DIR)/lib/
	@cp -a $(SOURCETOOLCHAINDIR)/arm-linux-gnueabihf/libc/usr/lib/*so* $(ROOT_DIR)/usr/lib/
	@cp -a $(SOURCETOOLCHAINDIR)/arm-linux-gnueabihf/libc/usr/lib/*.a $(ROOT_DIR)/usr/lib/
	@cp -a $(SOURCETOOLCHAINDIR)/arm-linux-gnueabihf/lib/*so* $(ROOT_DIR)/lib/
	@cp -a $(SOURCETOOLCHAINDIR)/arm-linux-gnueabihf/lib/*.a $(ROOT_DIR)/lib/

install:
	cp -f $(ROOT_IMAGE) $(PROJECT_ROOT)/img

clean:
	@rm -rf $(ROOT_IMAGE)


distclean:
	@rm -rf $(ROOT_IMAGE) $(ROOT_DIR)
	rm -f $(ROOT_DIR)/fs/shadow_root/*
