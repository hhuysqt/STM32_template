Templates for STM32 projects on linux.

Discriptions:
My developement board bases on STM32F103C8T6, with a LED tied to PB0. This program switches the LED every 0.5 seconds.

1   ./inc and ./src are for user's code files, whose Makefile is in ./src.
2   ./libs is for STM32 libraries. They are the USEFUL parts copied from STM32F10x_StdPeriph_Lib_V3.5.0/Libraries.
3   link.ld determines the properties of your MCU. (Currently I set them to STM32F103C8T6, 20K RAM, 64K FLASH)
4   Makefile.common describes the common makefile varibles, such as link libraries, gcc flags, CC types. And you should define the proper "TypeOfMCU" marco here. (Currently it's STM32F10X_MD)
5   Makefile would make libstm32.a in ./libs, app.a in ./src, and finally link them to form main.elf. It also extracts the elf informations to some text files.

I'm using arm-none-eabi-gcc to compile and link, along with arm-none-eabi-gdb to debug. It's cool!
These tools are avilable with package manager, such as apt-get:

#apt-get install gcc-arm-none-eabi gdb-arm-none-eabi

Makefiles are modified from others. See also:
https://www.embbnux.com/2014/02/01/linux_stm32_gcc_makefile/

File tree:
.
├── inc
├── libs
│   ├── CMSIS
│   │   ├── CoreSupport
│   │   │   ├── core_cm3.c
│   │   │   └── core_cm3.h
│   │   └── DeviceSupport
│   │       └── ST
│   │           └── STM32F10x
│   │               ├── Release_Notes.html
│   │               ├── startup
│   │               │   └── gcc_ride7
│   │               │       ├── startup_stm32f10x_cl.s
│   │               │       ├── startup_stm32f10x_hd.s
│   │               │       ├── startup_stm32f10x_hd_vl.s
│   │               │       ├── startup_stm32f10x_ld.s
│   │               │       ├── startup_stm32f10x_ld_vl.s
│   │               │       ├── startup_stm32f10x_md.s
│   │               │       ├── startup_stm32f10x_md_vl.s
│   │               │       └── startup_stm32f10x_xl.s
│   │               ├── stm32f10x.h
│   │               ├── system_stm32f10x.c
│   │               └── system_stm32f10x.h
│   ├── Makefile
│   └── STM32F10x_StdPeriph_Driver
│       ├── inc
│       │   ├── misc.h
│       │   ├── stm32f10x_adc.h
│       │   ├── stm32f10x_bkp.h
│       │   ├── stm32f10x_can.h
│       │   ├── stm32f10x_cec.h
│       │   ├── stm32f10x_crc.h
│       │   ├── stm32f10x_dac.h
│       │   ├── stm32f10x_dbgmcu.h
│       │   ├── stm32f10x_dma.h
│       │   ├── stm32f10x_exti.h
│       │   ├── stm32f10x_flash.h
│       │   ├── stm32f10x_fsmc.h
│       │   ├── stm32f10x_gpio.h
│       │   ├── stm32f10x_i2c.h
│       │   ├── stm32f10x_iwdg.h
│       │   ├── stm32f10x_pwr.h
│       │   ├── stm32f10x_rcc.h
│       │   ├── stm32f10x_rtc.h
│       │   ├── stm32f10x_sdio.h
│       │   ├── stm32f10x_spi.h
│       │   ├── stm32f10x_tim.h
│       │   ├── stm32f10x_usart.h
│       │   └── stm32f10x_wwdg.h
│       ├── Release_Notes.html
│       └── src
│           ├── misc.c
│           ├── stm32f10x_adc.c
│           ├── stm32f10x_bkp.c
│           ├── stm32f10x_can.c
│           ├── stm32f10x_cec.c
│           ├── stm32f10x_crc.c
│           ├── stm32f10x_dac.c
│           ├── stm32f10x_dbgmcu.c
│           ├── stm32f10x_dma.c
│           ├── stm32f10x_exti.c
│           ├── stm32f10x_flash.c
│           ├── stm32f10x_fsmc.c
│           ├── stm32f10x_gpio.c
│           ├── stm32f10x_i2c.c
│           ├── stm32f10x_iwdg.c
│           ├── stm32f10x_pwr.c
│           ├── stm32f10x_rcc.c
│           ├── stm32f10x_rtc.c
│           ├── stm32f10x_sdio.c
│           ├── stm32f10x_spi.c
│           ├── stm32f10x_tim.c
│           ├── stm32f10x_usart.c
│           └── stm32f10x_wwdg.c
├── linker.ld
├── Makefile
├── Makefile.common
├── README.md
└── src
    ├── main.c
    ├── Makefile
    └── startup.c

13 directories, 69 files
