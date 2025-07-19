# Installing the Xilinx ISE Software on Ubuntu 25.10

The FPGA used is a Spartan 3a level FPGA from Xilinx. This company has been bought by AMD.

## Finding and installing the required software on Ubuntu 25.04

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
./ise
```

## Problem: ISE Segfaults since 2025-07-19

Since this date ISE dies with a segmentation fault. Reinstalling does not help, it does the same. There is this [page that describes possible fixes](https://gist.github.com/aliemo/ce58ea570ee6ffa6dedfa569f87f1c1e). I did the following which at least cancelled the segmentation fault (copied from the above page):

Remove the NOTO fonts. I did:

```
sudo apt remove fonts-noto-cjk fonts-noto-color-emoji fonts-noto-core fonts-noto-hinted fonts-noto-mono fonts-noto-ui-core fonts-noto-unhinted python3-monotonic
```
I also edited the file ~/.config/Trolltech.conf and removed the reference to the Noto font. You can then try to start the qtconfig program (in the same shell where you tried to start ise) and change the font there to Ubuntu Sans.

This made the IDE work again.

If there is still trouble: the following might help too:

The ISE tools supply an outdated version of the libstdc++.so library, which may cause segfaults when using the Xilinx Microprocessor Debugger and prevents the usage of the oxygen-gtk theme. This outdated version is located in two directories within the installation tree: <installation-path>/ISE_DS/ISE/lib/lin64/ and <installation-path>/ISE_DS/common/lib/lin64

To use newer version of libstdc++, rename or delete the original files and replace them with symlinks:

```
cd <installation-path->ISE_DS/ISE/lib/lin64/
mv libstdc++.so libstdc++.so.orig
mv libstdc++.so.6 libstdc++.so.6.orig
mv libstdc++.so.6.0.8 libstdc++.so.6.0.8.orig
ln -s /usr/lib/libstdc++.so
ln -s libstdc++.so libstdc++.so.6
ln -s libstdc++.so libstdc++.so.6.0.8
```

Repeat this process in the <installation-path>/ISE_DS/common/lib/lin64

This did not stop the SEGFAULT if the Noto fonts are still installed though.

In hindsight I think the problem was caused because I installed KDE within Ubuntu around this time.

## Problem: unable to install ChipScope

Trying to install ChipScope into the project resulted in this:
```
Started : "Creating ChipScope Definition File".
Running inserter...
Command Line: inserter -intstyle ise -mode initial -proj /home/jal/prj/RL02/FPGA/chipscope.cdc -p xc3s50a -output_dir _ngo -ise_project_dir /home/jal/prj/RL02/FPGA
/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/inserter: 72: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/cs_common.sh: XIL_DIRS[0]=/opt/Xilinx/14.7/ISE_DS/ISE/: not found
/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/inserter: 73: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/cs_common.sh: count++: not found
/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/inserter: 152: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/cs_common.sh: Syntax error: Bad for loop variable
ERROR: Unable to create CDC source

Process "Creating ChipScope Definition File" failed
```

A solution [was found here](https://pradeepkb.wordpress.com/xilinx-chipscope-inserter-error/):

* Edit /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/analyzer and change #!/bin/sh to #!/bin/bash
* Do the same in /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/inserter

This solved the issue for me.
