#Templates for STM32 projects on linux.
---
##Discriptions:
My developement board bases on STM32F103C8T6, with a LED tied to PB0. This program switches the LED every 0.5 seconds.
<br>1   ./inc and ./src are for user's code files, whose Makefile is in ./src.
<br>2   ./libs is for STM32 libraries. They are the USEFUL parts copied from STM32F10x_StdPeriph_Lib_V3.5.0/Libraries.
<br>3   link.ld determines the properties of your MCU. (Currently I set them to STM32F103C8T6, 20K RAM, 64K FLASH)
<br>4   Makefile.common describes the common makefile varibles, such as link libraries, gcc flags, CC types. And you should define the proper "TypeOfMCU" marco here. (Currently it's STM32F10X_MD)
<br>5   Makefile would make libstm32.a in ./libs, app.a in ./src, and finally link them to form main.elf. It also extracts the elf informations to some text files.

##Tools:
<br>I'm using arm-none-eabi-gcc to compile and link, along with arm-none-eabi-gdb to debug. It's cool!
<br>(You don't need to use OpenOCD or OpenJTAG...)
<br>These tools are avilable with package manager, such as apt-get:
>**\# apt-get install gcc-arm-none-eabi gdb-arm-none-eabi**

You can find JLINK driver here:
<br>https://www.segger.com/jlink-software.html
<br>and JLink User Mannual here:
<br>https://www.segger.com/admin/uploads/productDocs/UM08001_JLink.pdf

<br>Makefiles are modified from others. See also:
<br>https://www.embbnux.com/2014/02/01/linux_stm32_gcc_makefile/

<br>Please refer to<br>
 http://mcuoneclipse.com/2012/11/01/defining-variables-at-absolute-addresses-with-gcc/ 
<br>and<br>
 http://www.embedds.com/programming-stm32-discovery-using-gnu-tools-linker-script/
<br>for tips to understand THIS stm32_flash.ld

##Steps:
1: Download Jlink **'Software and documentation pack'** and install it. With deb package (jlink_5.10.16_x86_64), you may use the following command:
>**\# dpkg -i jlink_5.10.16_x86_64.deb**

2: Make, and then you can see `main.elf`, `main.bin`, `main.hex`. At the same time, ELF information are extracted to `main.info_elf`, `main.info_code`, `main.info_size`, `main.info_symbol`.

3: **Debug with `arm-none-eabi-gdb`:** 
>Open a terminal and type (If you don't use SWD to debug, remove `-if SWD`):
>>**\# JLinkGDBServer -device stm32f103c8 -if SWD**

>Open another terminal, and launch:
>>**\$ arm-none-eabi-gdb main.elf**

>In it, type (`2331` is the default Jlink gdb server port):
>>**(gdb) target remote localhost:2331**
<br>**(gdb) load**
<br>**(gdb) monitor reset**

And then enjoy yourself debugging with `gdb`~~~
