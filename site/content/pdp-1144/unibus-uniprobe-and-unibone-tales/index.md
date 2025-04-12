# Unibus, Uniprobe and Unibone tales

As my PDP-11 came without peripherals I need something to make it come alive..

## Unibus information

There are multiple parts inside an Unibus:

- UNIBUS Slots are the real Unibus
- SPC are slots usually reserved for peripheral cards?

In addition, there are two versions of Unibus. Normal Unibus and modified Unibus. **These are not compatible!** In “newer” PDP-11’s both of these are present on the backplane, and it is a bad idea to use boards meant for the one in the other.

![](image-20230410-143835.png)

Picture [from here, where there is also way more information](http://retrocmp.com/tools/uniprobe/292-uniprobe-standard-unibus-modified-unibus).

To test the Unibone we need it in a terminated backplane like the DD11-CK:

![](image-20230422-101852.png)

We need two passive terminators (M930, donated by Geert):

![](image-20230422-102210.png)

![](image-20230422-102243.png)

Login to the Unibone with:

ssh root@ip

password: root

Follow the test instructions [from here](http://retrocmp.com/projects/unibone/287-unibone-acceptance-test)

More information:

- [Unibus - pinout](unibus-pinout/index.md)
- [SPC Slots pinout](spc-pinout/index.md)
- [Backplane types - overview](backplane-types-overview/index.md)
- [Unibone DD11 backplanes - detailed slot descriptions](backplanes-detailed-slot-descriptions/index.md)
