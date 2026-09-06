# The MOXA NPort 5610 serial <-> Ethernet device

This is a terminal server which can connect 8 RS232 serial ports and provide access to them through Ethernet.

![The NPort 5610 in its rack ears: the LCD and four buttons at the left, then Tx and Rx lamps for each of the eight ports.](image-20241109-094838.png)

The RS232 connections use RJ45 connectors. A loopback connector is provided with the following schematic:

![The loopback tester that came with it, part 1711020200015: TxD to RxD, RTS to CTS and DTR to DSR and DCD.](image-20241109-094955.png)

The pinout is this:

![The RJ-45 pinout for the 5610, with pin 1 at the left of the socket: DSR, RTS, GND, TxD, RxD, DCD, CTS, DTR.](image-20241109-181805.png)

The manual [can be found here](https://www.manualslib.com/download/1146192/Moxa-Technologies-Nport-5610-8.html).

The default login account on this device is admin/moxa.
