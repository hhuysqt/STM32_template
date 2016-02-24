# libs Makefile
include ../Makefile.common
LIBS+=libstm32.a
CFLAGSlib+=-c

all: libstm32.a

libstm32.a:
	@echo "  Building $@ ..."
	@cd $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x && \
		$(CC) $(CFLAGSlib) \
			system_stm32f10x.c
	@cd $(LIBDIR)/STM32F10x_StdPeriph_Driver/src && \
		$(CC) $(CFLAGSlib) \
			-D"assert_param(expr)=((void)0)" \
			*.c
	@echo "    Linking..."
	@$(AR) cr $(LIBDIR)/$@ \
		$(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/system_stm32f10x.o \
		$(LIBDIR)/STM32F10x_StdPeriph_Driver/src/*.o
	@echo "    Built $@ successfully."
.PHONY: libs clean tshow

clean:
	rm -f $(LIBDIR)/CMSIS/DeviceSupport/ST/STM32F10x/system_stm32f10x.o
	rm -f $(LIBDIR)/STM32F10x_StdPeriph_Driver/src/*.o
	rm -f $(LIBS)
tshow:
	@echo "######################################################################################################"
	@echo "################# optimize settings: $(InfoTextLib), $(InfoTextSrc)"
	@echo "######################################################################################################"
