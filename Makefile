KERNELRELEASE ?= $(shell uname -r)
BUILD_KERNEL_PATH ?= /lib/modules/$(KERNELRELEASE)/build
INSTALL_MOD_PATH ?= $(INSTALL_PATH)/lib/modules/$(KERNELRELEASE)
INSTALL_SPREAD_SPECTRUM_PATH ?= $(INSTALL_MOD_PATH)/kernel/drivers/spread

obj-m := spread_spectrum.o
obj-y := spread_spectrum.o

spreadspec-objs := spread_spectrum.o

modules: all
all: spread_spectrum.ko

spread_spectrum.ko: spread_spectrum.c

install: all
	mkdir -p $(INSTALL_SPREAD_SPECTRUM_PATH)
	install -m 644 spread_spectrum.ko $(INSTALL_SPREAD_SPECTRUM_PATH)

modules_install:
	mkdir -p $(MODLIB)
	install -m 644 spread_spectrum.ko $(MODLIB)

clean:
	$(MAKE) -C $(BUILD_KERNEL_PATH) M=$(CURDIR) clean
