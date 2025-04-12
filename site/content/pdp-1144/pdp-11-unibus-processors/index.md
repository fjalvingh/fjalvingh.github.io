# PDP 11 Unibus processors

| **Machine** | **Year** | **CPU** | **Instruction set** | **Tests** |
| --- | --- | --- | --- | --- |
| 11/20, 11/15 | 1970 | KA11 | Base |     |
| 11/45 | 1972 | KB11-A, KB11-D |     |     |
| 11/50 | 1973 |     |     |     |
| 11/55 | 1976 |     |     |     |
| 11/35, 11/40 | 1973 |     | Basic, Sob, Xor |     |
| 11/05, 11/10 | 1972 |     | Basic, ASH w/ option KE11-A |     |
| [11/70](https://gunkies.org/wiki/PDP-11/70) | 1975 | KB11-B, KB11-C | Basic, Sob, Xor |     |
| 11/04 | 1975 |     | Basic |     |
| [11/34](https://gunkies.org/wiki/PDP-11/34) | 1976 | KD11-E, KD11-EA | Basic, Sob, Xor, MTPS<br><br>> [!NOTE]<br>> MTPS was found in the code for FKACA, the CPU test for the EIS instructions. [Also see here](https://www.conservapedia.com/PDP-11). where it is stated that the 11/34 supported that. |     |
| 11/60 | 1977 |     | Basic, Sob, Xor |     |
| 11/44 | 1979 |     | Basic, Sob, Xor, MFPT |     |
| 11/24 | 1979 |     | Basic, Sob, Xor, MFPT |     |
| 11/84 | 1985 |     |     |     |
| 11/94 | 1990 |     |     |     |

Instruction sets:

- Base: 11/20 basic instruction set
- Sob: SOB, MARK, RTT, SXT instructions
- ASH: ASH, ASHC, MUL, DIV instructions
- XOR: ASH: ASH, ASHC, MUL, DIV, XOR instructions
- MFPT: MFPT instruction
-   “Upon execution, the MFPT instruction returns to the low byte of R0 a processor model code(octal 3 for PDP 11/68). The high byte of R0 will be loaded with a processor specified subcode(octal 0 for PDP 11/68.”
- MFPS/MTPS instruction (LSI-11) (move to/from PSW)

For XXDP tests [take a look at this page](https://www.pdp-11.nl/xxdp-list.html) from Henk Gooijen (Thanks, Henk!).

Instruction set info:

- [Lots of details](https://sourceware.org/binutils/docs-2.40/as/PDP_002d11_002dOptions.html)
- [PDP 11 architecture has some info too](https://gunkies.org/wiki/PDP-11_architecture)
- [Inconsistencies from retrocomputing stack exchange](https://retrocomputing.stackexchange.com/questions/4661/pdp-11-instruction-set-inconsistencies)
