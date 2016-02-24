#Templates for STM32 projects on linux.

##Discriptions:
My developement board bases on STM32F103C8T6, with a LED tied to PB0. This program switches the LED every 0.5 seconds.
<br>1   ./inc and ./src are for user's code files, whose Makefile is in ./src.
<br>2   ./libs is for STM32 libraries. They are the USEFUL parts copied from STM32F10x_StdPeriph_Lib_V3.5.0/Libraries.
<br>3   link.ld determines the properties of your MCU. (Currently I set them to STM32F103C8T6, 20K RAM, 64K FLASH)
<br>4   Makefile.common describes the common makefile varibles, such as link libraries, gcc flags, CC types. And you should define the proper "TypeOfMCU" marco here. (Currently it's STM32F10X_MD)
<br>5   Makefile would make libstm32.a in ./libs, app.a in ./src, and finally link them to form main.elf. It also extracts the elf informations to some text files.

##Tools:
<br>I'm using arm-none-eabi-gcc to compile and link, along with arm-none-eabi-gdb to debug. It's cool!
<br>(There's no need to use OpenOCD or OpenJTAG...)
<br>These tools are avilable with package manager, such as apt-get:

**\# apt-get install gcc-arm-none-eabi gdb-arm-none-eabi**

You can find JLINK driver here:

https://www.segger.com/jlink-software.html

<br>Makefiles are modified from others. See also:
<br>https://www.embbnux.com/2014/02/01/linux_stm32_gcc_makefile/

##File tree:
<br>.
<br>├── inc
<br>├── libs
<br>│   ├── CMSIS
<br>│   │   ├── CoreSupport
<br>│   │   │   ├── core_cm3.c
<br>│   │   │   └── core_cm3.h
<br>│   │   └── DeviceSupport
<br>│   │       └── ST
<br>│   │           └── STM32F10x
<br>│   │               ├── Release_Notes.html
<br>│   │               ├── startup
<br>│   │               │   └── gcc_ride7
<br>│   │               │       ├── startup_stm32f10x_cl.s
<br>│   │               │       ├── startup_stm32f10x_hd.s
<br>│   │               │       ├── startup_stm32f10x_hd_vl.s
<br>│   │               │       ├── startup_stm32f10x_ld.s
<br>│   │               │       ├── startup_stm32f10x_ld_vl.s
<br>│   │               │       ├── startup_stm32f10x_md.s
<br>│   │               │       ├── startup_stm32f10x_md_vl.s
<br>│   │               │       └── startup_stm32f10x_xl.s
<br>│   │               ├── stm32f10x.h
<br>│   │               ├── system_stm32f10x.c
<br>│   │               └── system_stm32f10x.h
<br>│   ├── Makefile
<br>│   └── STM32F10x_StdPeriph_Driver
<br>│       ├── inc
<br>│       │   ├── misc.h
<br>│       │   ├── stm32f10x_adc.h
<br>│       │   ├── stm32f10x_bkp.h
<br>│       │   ├── stm32f10x_can.h
<br>│       │   ├── stm32f10x_cec.h
<br>│       │   ├── stm32f10x_crc.h
<br>│       │   ├── stm32f10x_dac.h
<br>│       │   ├── stm32f10x_dbgmcu.h
<br>│       │   ├── stm32f10x_dma.h
<br>│       │   ├── stm32f10x_exti.h
<br>│       │   ├── stm32f10x_flash.h
<br>│       │   ├── stm32f10x_fsmc.h
<br>│       │   ├── stm32f10x_gpio.h
<br>│       │   ├── stm32f10x_i2c.h
<br>│       │   ├── stm32f10x_iwdg.h
<br>│       │   ├── stm32f10x_pwr.h
<br>│       │   ├── stm32f10x_rcc.h
<br>│       │   ├── stm32f10x_rtc.h
<br>│       │   ├── stm32f10x_sdio.h
<br>│       │   ├── stm32f10x_spi.h
<br>│       │   ├── stm32f10x_tim.h
<br>│       │   ├── stm32f10x_usart.h
<br>│       │   └── stm32f10x_wwdg.h
<br>│       ├── Release_Notes.html
<br>│       └── src
<br>│           ├── misc.c
<br>│           ├── stm32f10x_adc.c
<br>│           ├── stm32f10x_bkp.c
<br>│           ├── stm32f10x_can.c
<br>│           ├── stm32f10x_cec.c
<br>│           ├── stm32f10x_crc.c
<br>│           ├── stm32f10x_dac.c
<br>│           ├── stm32f10x_dbgmcu.c
<br>│           ├── stm32f10x_dma.c
<br>│           ├── stm32f10x_exti.c
<br>│           ├── stm32f10x_flash.c
<br>│           ├── stm32f10x_fsmc.c
<br>│           ├── stm32f10x_gpio.c
<br>│           ├── stm32f10x_i2c.c
<br>│           ├── stm32f10x_iwdg.c
<br>│           ├── stm32f10x_pwr.c
<br>│           ├── stm32f10x_rcc.c
<br>│           ├── stm32f10x_rtc.c
<br>│           ├── stm32f10x_sdio.c
<br>│           ├── stm32f10x_spi.c
<br>│           ├── stm32f10x_tim.c
<br>│           ├── stm32f10x_usart.c
<br>│           └── stm32f10x_wwdg.c
<br>├── linker.ld
<br>├── Makefile
<br>├── Makefile.common
<br>├── README.md
<br>└── src
<br>    ├── main.c
<br>    ├── Makefile
<br>    └── startup.c
<br>
<br>13 directories, 69 files
