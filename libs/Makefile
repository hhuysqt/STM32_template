# libs Makefile
include ../Makefile.common
CFLAGSlib+=-c

libs_md: libstm32.a libstartup_md.a

libs_hd: libstm32.a libstartup_hd.a

libstm32.a:
	@echo "  Building $@ ..."
	@cd $(LIBDIR)/STM32F10x_StdPeriph_Driver/src && \
		$(CC) $(CFLAGSlib) \
			-D"assert_param(expr)=((void)0)" \
			*.c
	@echo "    Linking..."
	@$(AR) cr $(LIBDIR)/$@ \
		$(LIBDIR)/STM32F10x_StdPeriph_Driver/src/*.o
	@echo "    Built $@ successfully."

libstartup_md.a:
	@echo "    Building $@..."
	@cd $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x && \
		$(CC) $(CFLAGSlib) \
			system_stm32f10x.c
	@cd $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/startup/gcc_ride7 && \
		$(CC) $(CFLAGSlib) \
			startup_stm32f10x_md.s
	@$(AR) cr $(LIBDIR)/$@ \
		$(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/system_stm32f10x.o \
		$(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/startup/gcc_ride7/startup_stm32f10x_md.o
	@echo "   Finished $@"

libstartup_hd.a:
	@echo "    Building $@..."
	@cd $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x && \
		$(CC) $(CFLAGSlib) \
			system_stm32f10x.c
	@cd $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/startup/gcc_ride7 && \
		$(CC) $(CFLAGSlib) \
			startup_stm32f10x_hd.s
	@$(AR) cr $(LIBDIR)/$@ \
		$(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/system_stm32f10x.o \
		$(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/startup/gcc_ride7/startup_stm32f10x_hd.o
	@echo "   Finished $@"

.PHONY: libs clean tshow

clean:
	rm -f $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/system_stm32f10x.o
	rm -f $(LIBDIR)/STM32F10x_StdPeriph_Driver/src/*.o
	-rm -f libstm32.a libstartup_hd.a libstartup_md.a
