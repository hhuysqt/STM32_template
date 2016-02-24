# general Makefile
# make OptLIB=0 OptSRC=0 all tshow  
include Makefile.common
LDFLAGS=$(COMMONFLAGS) -fno-exceptions -ffunction-sections -fdata-sections -L$(LIBDIR) -nostartfiles -Wl,--gc-sections,-Tlinker.ld

LDLIBS+=-lm
LDLIBS+=-lstm32
# LDLIBS+=-lgcc

all: tshow libs src
	$(CC) -o $(PROGRAM).elf $(LDFLAGS) \
		-Wl,--whole-archive \
			src/app.a \
		-Wl,--no-whole-archive \
			$(LDLIBS)
	$(OBJCOPY) -O ihex $(PROGRAM).elf $(PROGRAM).hex
	$(OBJCOPY) -O binary $(PROGRAM).elf $(PROGRAM).bin
#Extract info contained in ELF to readable text-files:
	arm-none-eabi-readelf -a $(PROGRAM).elf > $(PROGRAM).info_elf
	arm-none-eabi-size -d -B -t $(PROGRAM).elf > $(PROGRAM).info_size
	arm-none-eabi-objdump -S $(PROGRAM).elf > $(PROGRAM).info_code
	arm-none-eabi-nm -t d -S --size-sort -s $(PROGRAM).elf > $(PROGRAM).info_symbol

.PHONY: libs src clean tshow

libs:
	$(MAKE) -C libs
src:
	$(MAKE) -C src

clean:
	$(MAKE) -C src $@
	$(MAKE) -C libs $@
	rm -f \
		$(PROGRAM).elf \
		$(PROGRAM).hex \
		$(PROGRAM).bin \
		$(PROGRAM).info_elf \
		$(PROGRAM).info_size \
		$(PROGRAM).info_code \
		$(PROGRAM).info_symbol

tshow:
	@echo "$(TOP)"
	@echo "######################################################################################################"
	@echo "                          Making : $(PROGRAM)"
	@echo "             optimize settings: $(InfoTextLib), $(InfoTextSrc)"
	@echo "######################################################################################################"

flash:all
	./do_flash.pl $(TOP)/main.bin  