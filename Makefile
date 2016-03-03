# general Makefile
# make OptLIB=0 OptSRC=0 all tshow  
include Makefile.common
LDFLAGS=$(COMMONFLAGS) -fno-exceptions -ffunction-sections -fdata-sections -L$(LIBDIR) -nostartfiles 

LDLIBS+=-lstm32

define extract_info
	@echo '              Extract info contained in ELF to readable text-files:'
	arm-none-eabi-readelf -a $(PROGRAM).elf > $(PROGRAM).info_elf
	arm-none-eabi-size -d -B -t $(PROGRAM).elf > $(PROGRAM).info_size
	arm-none-eabi-objdump -S $(PROGRAM).elf > $(PROGRAM).info_code
	arm-none-eabi-nm -t d -S --size-sort -s $(PROGRAM).elf > $(PROGRAM).info_symbol
endef

define extract_bin_hex
	$(OBJCOPY) -O ihex $(PROGRAM).elf $(PROGRAM).hex
	$(OBJCOPY) -O binary $(PROGRAM).elf $(PROGRAM).bin
endef
	
stm32_md: tshow libs_md src
	@echo 'Building for STM32 MD devices'
	$(CC) -o $(PROGRAM).elf $(LDFLAGS) \
		src/*.o \
		$(LDLIBS) -lstartup_md \
		-Wl,--gc-sections,-Tstm32_md.ld
	$(call extract_bin_hex)
	$(call extract_info)

stm32_hd: tshow libs_hd src
	@echo 'Building for STM32 HD devices'
	$(CC) -o $(PROGRAM).elf $(LDFLAGS) \
		src/*.o \
		$(LDLIBS) -lstartup_hd \
		-Wl,--gc-sections,-Tstm32_hd.ld
	$(call extract_bin_hex)
	$(call extract_info)

.PHONY: libs_hd libs_md src clean tshow stm32_md stm32_hd

libs_md:
	$(MAKE) -C libs $@

libs_hd:
	$(MAKE) -C libs $@

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
	@echo "##########################################################################################"
	@echo "                          Making : $(PROGRAM)"
	@echo "             optimize settings: $(InfoTextLib), $(InfoTextSrc)"
	@echo "##########################################################################################"

flash:all
	./do_flash.pl $(TOP)/main.bin  
