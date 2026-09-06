# M7098 UNIBUS Interface

This handles all UNIBUS chores. It contains part of the memory management unit: the Unibus MAP (which handles address translation from 18 bit to 22 bits for peripherals).

It also has an optional set of boot PROMs which contain bootstrap code to allow the machine to boot from different peripherals.

![The M7098. The boot PROM sockets run along the top under the BT ROMS legend, with 446F1 written in red on the fitted one and the option switch pack in red at the right.](image-20230416-201307.png)

This contains a boot PROM “446F1” which I cannot find info on.
