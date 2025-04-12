# Using GPIB on Linux

Installing linux-gpib

Download the software that is closest to the kernel version you have. There are a few things to do:

TBD

Configuring

The driver used is tnt4882. It gets detected automatically but needs to be configured before use by running gpib\_config as root, as follows:

```
sudo gpib_config --minor 0
```

This should result in dmesg:

```
[ 2791.630535] mite: 0xf0504000 mapped to 44dd6e7a
[ 2791.630554] mite: daq: 0xf0500000 mapped to 547a0c27
[ 2791.630568] tnt4882: irq 16
[ 2791.630573] tnt4882: TNT5004 chipset detected
```

Once done you can use hpdir by default. Do not use scan; this is for ISA/PnP only.

Now if only the GPIB cable fit, sigh….
