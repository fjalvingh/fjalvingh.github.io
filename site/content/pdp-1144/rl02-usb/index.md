# Using the RL02 as an USB drive

!WARNING Incomplete, in progress.

There is a project on the Internet where someone created a board which allows the RL02 to be used as an USB drive. The project is quite old (10 years in 2025) and not well described; there is just a Github repo without instructions. I got a board for this project from Ed, and am trying to get the code on that board - and the result to work. This document is the log of things done so far..

## The project

The project [can be found here](https://github.com/ChrisPVille/RL02/)

The repo contains the KiCAD board design, the gerbers and everything else to get the board constructed. The board consists of a microcontroller (a Texas Instruments Tiva TM4C1232D5PM) and an FPGA (a XC3S50A-4VQ100). The FPGA does all of the heavy work; the uC is used to implement the USB mass storage part only.

## Building and installing the uC code

### Installing the TI software

To build the code you need to install TI's Code Composer Studio. This helpfully exists in two completely incompatible versions: an older version based on Eclipse, and a newer one based on VS Code. The latter does not seem to be very complete and it did not recognize the project at all, so I used the Eclipse version (I used 12.8.1.00005). You will also need to download the SDKs mentioned in the description of the project and install those in the IDE (steps will follow later, I forgot to write them down).

After installation the IDE might fail to start with an executable stack error:
```
libMiniDump.so: cannot enable executable stack as shared object requires
```
This can be fixed by installing execstack (apt install execstack) followed by:
```
execstack -c /home/jal/opt/ccs1281/ccs/eclipse/../ccs_base/common/bin/libMiniDump.so
```

After this you should be able to start ccstudio, and open the uC project.

### Building the code

Before you build the code we need to add missing configuration to the build, because the build as it is outputs a "RL02Controller.out" file which is an ELF file, but we need a flashable .bin file.

To add this to the build do the following:

* Open the RL02Controller project properties
* Select the "Build" tab at the left
* Select the "Steps" tab in the tab panel
* Enter the following in the Post-Build steps:

```
${CCE_INSTALL_ROOT}/utils/tiobj2bin/tiobj2bin ${BuildArtifactFileName} ${BuildArtifactFileBaseName}.bin ${CG_TOOL_ROOT}/bin/armofd ${CG_TOOL_ROOT}/bin/armhex ${CCE_INSTALL_ROOT}/utils/tiobj2bin/mkhex4bin
```
(That is all one line; you will need to surround the paths with quotes if you are infected with Windows).

Once set do a "Rebuild all", which will take forever (about 8 minutes on my 48CPU Threadripper), and that should result in a RL02Controller.bin file in the Debug directory.

### Flashing the uC

To flash the uC you need a tool that will let you. I used the Blackhawk xds100v2 tool. This needs to be connected to the board as follows:

![flash tool connection](uc-flash-conn.png)

To program you need to power both the flasher and the board. To power the board make sure to place a strap on jp1, otherwise the 5V USB power will not reach the board, see the arrow in the above picture.

[Download the flash tool (Uniflash) from here](https://www.ti.com/tool/UNIFLASH) and install it.

Run the Uniflash tool, select the correct controller and flash tool, then connect power to the board and flash, then verify.

Round 1: the tool said flashing was successful; the verify worked too, but after flashing I did not have USB response when connecting the board. I would have expected it to register the mass storage device..

## Installing the FPGA code

The FPGA used is a Spartan 3a level FPGA from Xilinx. This company has been bought by AMD.

### Finding and installing the required software on Ubuntu 25.04

The Spartan 3a FPGA's are not supported by Vivado, the modern IDE from Xilinx. Instead we will need a tool called ISE, which is quite old software. The last version is 14.7, from 2015. Google for it and download the .tar.gz file, after that untar the archive and run the setup using "sudo ./xsetup".

You might have a failure because it cannot find libncurses.so.5. If so then do the following:
```
$ cd /usr/lib/x86_64-linux-gnu
$ sudo ln -s libncurses.so.6 libncurses.so.5
```
After that the installer should work. Install the full edition including cable drivers. The cable driver install will fail, but ignore that.

After installing you will need to get a license. The license manager that is supposed to start does not, so [go here to get one](https://account.amd.com/en/forms/license/license-form.html). You will need to apply for the free "WebPack" license. This will email you a license file. Place this license file in "/opt/Xilinx/14.7/ISE_DS/ISE/coregen/core_licenses".

After that do the following to start ISE:

```bash
cd /opt/Xilinx/14.7/ISE_DS
. settings64.sh
cd ISE/bin/lin64
./ISE

```

### Opening the FPGA code in ISE

Start ISE, then select "Open Project" and select the project file in the FPGA directory. This should open the project without too much trouble. After that do the build steps by selecting the top module, then with the right mouse button select "run":

![Synthesize design](fpga-implement.png)

The next step is to generate the programming file using the same right mouse -> run step, followed by "Configure target device". This should open a tool called "iMPACT", which should be able to program the FPGA.

### Configuring iMPACT

Use "Open Project", and load the impact file from the FPGA directory. This should show the basic configuration:

![initial impact after load](fpga-impact-1.png)

Next step is to try "program". That failed on my machine because the Xilinx USB Platform cable was not recognized. To make this work (Ubuntu Linux 25.04) do the following.

Disconnect the platform cable, then:
```
$ sudo apt install libusb-dev fxload
$ cd /opt/Xilinx/
$ sudo git clone git://git.zerfleddert.de/usb-driver
$ cd usb-driver/
$ sudo make
$ ./setup_pcusb /opt/Xilinx/14.7/ISE_DS/ISE
$ sudo udevadm control --reload-rules
```
(Shamelessly stolen from https://askubuntu.com/questions/838260/install-xilinx-platform-usb-in-ubuntu-16-04-x64/1128841#1128841, with thanks!)

After this, reconnect the platform cable and try again; the thing should now be recognized.

This should now make the cable work.

### Programming the FLASH

Programming the FPGA only does that once; as soon as power disappears the FPGA is empty again. This is why we have the M25P10 flash aboard. It can be programmed with the bitstream for the FPGA, and at reset the FPGA will read the bitstream from that flash.
The flash chip is only connected to the FPGA, so to program it we need to use a trick: we need to send something to the FPGA that will let _it_ program the flash. This can be done fully automagically by iMPACT, [The process is very well described here](https://docs.amd.com/r/en-US/xapp586-spi-flash/Programming-the-SPI-Flash-In-System).

Use PROGRAM on the FLASH chip in the image, and make sure to also VERIFY.

### Links to documentation used

* [Getting a flashable output file](https://kitflix.com/getting-started-with-tiva-launchpad-tm4c123/)
* [Errors during the conversion to .bin](https://software-dl.ti.com/ccs/esd/documents/sdto_cgt_tiobj2bin_failed.html)
- [Getting the USB Platform cable to be recognized](https://askubuntu.com/questions/838260/install-xilinx-platform-usb-in-ubuntu-16-04-x64/1128841#1128841)




