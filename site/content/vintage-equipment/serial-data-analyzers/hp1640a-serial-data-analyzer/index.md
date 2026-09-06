# HP1640A Serial Data Analyzer

Gotten from Domaine d’Espitalet inheritance.

![The 1640A as found: grubby, but with the whole keypad and the LINE switch intact. The sticker above it still says Learjet Inc, Engineering Lab, reference only.](image-20240707-123812.png)

The machine was dirty but quite complete.

## Internals

![Inside, seen from the top: the linear supply and its transformer down the left, the card cage on the right, and the CRT below.](image-20240707-123949.png)

The power supply is a linear one and has some nice large elco’s:

![One of the supply cans up close, a Sprague 673D133, 3300uF at 6.3V.](image-20240707-124121.png)

These were removed and tested, and all of them tested fine. I removed them and reformed them for 8 hours so that they get used to being under power again.

![The 01640-66502 power supply board, with its fuses along the bottom edge and the +15 ADJUST pot at the top right.](image-20240707-124445.png)

![The card cage pulled out on its slides, four boards deep, with the analog board standing at the back.](image-20240707-124534.png)

![The 01640-66516 microprocessor board. The AM9080 sits at the left, next to an 8228 bus controller, with a row of empty ROM sockets across the middle.](image-20240707-124741.png)

![The 01640-66504 interface board: an 8255A, an 8253 timer and two 8251A USARTs, with the blue Clare relay at the top.](image-20240707-124851.png)

![The 01640-66505 display processor, another 8008-era board, this one built almost entirely from LS parts.](image-20240707-125049.png)

![The trigger and SDLC boards still seated in the cage, above the CPH 8100-60 ST backplane connectors.](image-20240707-125133.png)

![The 01640-66510 SDLC board out of the cage, with an 8286A transceiver along the bottom edge.](image-20240707-125331.png)

![The 01640-66512 trigger board, filled with 2102 static RAMs down the right-hand side.](image-20240707-125509.png)

The main CPU is an AM9080, a 8080 clone (1820-2006).

## Initial startup

After cleaning the machine started but with an error message:

![The format screen after cleaning, with WARNING--RAM ERROR, U-32 across the top.](image-20240707-165052.png)

U32 was a socketed chip with the HP number 1818-0348 which should be an AM9102DPC, a 1024x1 bit static RAM. Swapping the chip on other places where it is used follows the chip around so it is the chip..
