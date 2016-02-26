# src Makefile

include ../Makefile.common

all: 
	$(CC) -c *.c $(CFLAGS)
.PHONY: clean tshow

clean:
		rm -f app.a $(OBJS)
tshow:
		@echo "######################################################################################################"
		@echo "################# optimize settings: $(InfoTextLib), $(InfoTextSrc)"
		@echo "######################################################################################################"
