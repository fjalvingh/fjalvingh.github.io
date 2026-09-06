# Console work

With a working power supply I see signals on the console: when switching on
the lamps start in one state, then move to another. Next step is to see whether
deposit and examine work.

Entering a pattern in the switches and clicking "Load address" works, but only after using "start" once after powerup:

![Load address](load-addr-1.png)

Rather good sign as this is handled by microcode, and that means that we have a bit working at least!

## Using "exam"

Loading an address (like 70), doing a "Load Addr", then "Exam" does not show anything. Once an exam
has been done the "load addr" stop working; we need a new "Start" to get it back in working order.
The 11/05 exposes part of its registers at address 177700. This addresses the scratchpad RAM (E37..E40 on the DP) which contains the registers. Entering this address and pressing "load addr", then "examine" does work: the examine shows a value, and the load addr switch remains working.

We can [actually run a program there](https://retrocomputing.stackexchange.com/questions/27633/pdp-11-program-to-execute-only-in-the-registers), so let's try that.. The program is this:

| Address | Register | Opcode | Instr |
| --- | --- | --- | --- |
| 177700 | R0 | 000240 | NOP |
| 177701 | R1 | 000777 | BR.-1* |

!i For a program running from the scratchpad registers the PC increments by 1! The registers are addressed sequentially by addresses incremented by 1, despite the registers being words!




