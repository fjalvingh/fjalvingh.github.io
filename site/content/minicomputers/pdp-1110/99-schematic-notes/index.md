# Notes on the schematics and the processor

## The scratchpad registers

The CPU uses 7489 16x4 bit RAMs for its registers. The assignments for those are as follows:

| Register(s) | What is it |
| ----------- | ---------- |
| R0..R7      | The general purpose registers, R6=SP, R7=PC |
| R10         | Source operand |
| R11         | Destination operand |
| R12         | Interrupt vector |
| R13..R16    | Unused |
| R17         | Load address |

All 16 registers are present from 177700-177717 by the CPU only.

## The switch register

The manual talks about the switch register, but this does not exist at all, in reality. When the CPU decodes its address (1777570) it switches the multiplexer that is before the A input of the ALU to use the values as set from the switches, and it immediately generates the SSYN. 
Hence, the values come directly from the console board through the BERG connector.

### How the load addr switch uses the switch registers and the scratchpad

You can see the whole mechanism in the LOAD ADRS microcode:

```
CL-1   BA ← K[207].BAR ; DATI ; CKOFF
CL-2   B ← UNIBUS DATA
CL-3   R[17] ← B ; GOTO H-2
```

CL-1 builds 177570 by taking 207 from the 8-bit constants ROM and complementing it through the ALU into the BA, then issues a genuine DATI. The bus cycle is real from the microcode's point of view; it just never leaves the boards. This is also why LOAD ADRS still works on a machine with no memory installed.

CL-2 reads the data from UNIBUS into the B register, and finally CL-3 stores it in R17 (octal) in the scratchpad RAM.

