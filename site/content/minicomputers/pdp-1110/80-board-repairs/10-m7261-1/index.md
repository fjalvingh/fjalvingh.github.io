# M7261 Control #1

This board allows using the console, but running a program from memory fails.

## Initial analysis: running a program from memory

I tried to run a program from memory. I deposited just a 000777 (br .-2) at address 1000, then started from there. This did not work: the run light stayed off. I then checked 177707 (the PC) which read 000000. Not very informative. I then set the following:

| Address | Value | Why |
| ------ | ----- | ----- |
| 4 | 000006 | Bus error goes to address 6, halts, PC should show 10 |
| 6 | 000000 | Target of trap 4, halt instruction |
| 10 | 000012 | Target of illegal instruction trap, when taken PC should show 14 |
| 12 | 000000 | Target of illegal instruction trap, nop |
| 177706 | 1000 | Stack pointer, set to 1000 |

And of course the branch at 1000.

This still produced a PC = 0 - which should not be possible if anything here runs. I also examined SP, and that too remained at 1000. This probably means no traps were taken.

The machine halted, so if anything at all ran then this might mean that for some reason PC was 1777776. 

Next round:
- put a halt at 1000, then start. This delivers the same pc=0.
- put a br .-2 at 1000 (000777), then single step: switch on halt, start at 1000, then a single continue. This shows something odd: the LEDs show 1777776.

This indicates that the first fetch goes to address 1777776, not 1000. This cannot come in any way from a memory issue because every bit is different. My friend Claude reasons this:


    The address itself is the useful clue. 177776 can't come from 001000 through a stuck bit or two, since almost every bit differs. It looks much more like the bus address register (BA) holding a leftover value instead of being loaded with the PC. The 11/05's PS is a bus-addressable register at 177776, and it's plausible that the START microcode touches it, for example to clear it, just before the first fetch. If the BA load that should put the PC into BA doesn't happen, BA still holds 177776 and the fetch goes there. The register-space start could survive this because fetches from 1777xx are handled internally and never depend on that same BA transfer. The console's examine and deposit load BA through the console path, which works. So the prime suspect is the transfer of the PC into BA during instruction fetch: the BA load clock/enable in that microstep, or the multiplexer that selects what goes into BA.

    Two quick checks will confirm which side of that transfer is at fault:

    With the switch on HALT, do LOAD ADDR 1000 and START, but don't press CONT yet. Examine 177707.
    If the PC reads 001000, the PC is correct and the problem is getting it into BA, which is the BA hypothesis.
    If the PC already reads 177776, the START sequence itself loads the wrong value into the PC. Look at the load-address path instead.
    Do the same single-step experiment starting at 177700 and see what the lights show. That will tell you whether that path really bypasses the problem.

Doing that check reveals that the PC is 1000.

Next test: see whether the CPU can do Unibus reads. Deposit the following:

| Address | Value | Why |
| ------ | ----- | ----- |
| 1000   | 123456 | A value to read |
| 177700 | 013703 | MOV @#1000,R3 | 
| 177701 | 1000 | The 1000 operand of the above instr |
| 177702 | 0 | Halt |
| 177703 | 0 | Start with clearing R3 |

Running this shows that R3, after the run, holds 123456 which means that the CPU CAN read Unibus memory.



