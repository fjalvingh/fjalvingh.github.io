# Console work

With a working power supply I see signals on the console: when switching on
the lamps start in one state, then move to another. Next step is to see whether
deposit and examine work.

Entering a pattern in the switches and clicking "Load address" works, but only after using "start" once after powerup:

![The switch pattern coming back on the ADDRESS/DATA lamps after Load Address, though only once START has been pressed after power-up.](load-addr-1.png)

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

This showed an error: depositing the 240 actually deposited 540. Next try: deposit all zeroes in 177700 showed 400; repeated tries always showed that. And it persists: repeating deposit several times shows the same bit set; examine several times also shows it set (the address increment seems to work because the pattern changes after a few clicks). Bit 8 is really stuck, somehow. Not in the console shift regs because load addr sets it to zero.

## The path from switches to scratch register

The console switches are each connected, via the console cable, to the ALU board's "Switch reg mux", made up out of 4x 8266 quad 2-to-1 multiplexers (E33..E36). This multiplexer selects either the switch value (A ports) or the 7489 scratchpad RAM outputs to the ALU's "A" input.





