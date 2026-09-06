# HP 5006A Signature Analyzer

![The 5006A front panel: the signature display, the GATE, COMPOSITE SIGNATURE and UNSTABLE lamps, and the FUNCTION and POLARITY key rows below.](image-20240707-142612.png)

and its probes:

![The timing pod with its START, STOP, CLOCK and ground leads, and the data probe that goes with it.](image-20240707-142638.png)

Gotten from the Domaine d’Espitalet inheritance

In very good state, just a bit of cleaning needed.

## Internals

## Pictures

![Inside: the 05006-60001 board fills the case, with the mains transformer at the top left and the ribbon to the front panel at the right.](image-20240707-142723.png)

![The processor area close up. The purple ceramic module marked 05006-80003 sits in the middle, surrounded by 74F86 and 74F175 logic.](image-20240707-142808.png)

![The other half of the board, with the 1826-0630 hybrid in the middle and the front panel switch bank at the right.](image-20240707-142830.png)

## Special chips

### Mostek MK38P70/02H

This is an OEM microprocessor based on the [Fairchild F8](https://en.wikipedia.org/wiki/Fairchild_F8). It is quite a strange chip because it has an embedded socket for a (EP)ROM:

![What makes the MK38P70 odd: the top of the package is itself a socket, so the program EPROM plugs into the processor.](image-20240707-142256.png)
