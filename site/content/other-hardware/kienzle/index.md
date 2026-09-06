# The Kienzle 1140-20 Taxameter

This is a taxi fare meter from the 1970's, containing an Intel 4004 CPU ;)

![The meter as it was advertised: a Kienzle ARGO with LIBRE and four tariff positions, still labelled for a Paris taxi firm.](front.png)

If it works it would look something like this:

![Four of the meters lit and running, showing FAHRPREIS and ZUSCHLAG in Deutschmarks on their orange displays.](fourworking.png)


The electronics are three stacked boards. The CPU board contains the P4004 and some support chips like the P4002-1 (RAM/IO) and the P4308 (?):

![The CPU board. The P4004 sits in the middle of the lower edge with the P4002-1 RAM/IO above it and the P4308 ROM below, all dated 1974.](cpuboard-1.png)

## Connections / installation manual

The following was found on [CPU-World](https://www.cpu-world.com/forum/viewtopic.php?p=303885), with lots of thanks to user wepwawet:

* [Installation information](install.pdf)

That document describes a 22 pin connector which my device does not have. The pinout seems to be:

| pin   | Description   |
| ----- | ------------- |
| 10    | +12V perm     |
| 9     | GND           |
| 8     | Ignition +12V |
| 7..2  | Relais lamps  |
| 1     | ?             |


## Documentation

* [The user manual (German)](1140-Komplett.pdf)
