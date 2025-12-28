# Instruction set

Musings about the instruction set.

## Registers

We use the 16 registers from the 2901 as general registers. r0..14 are free for use. r14 is the stack pointer, it can also be specified as "sp". r15 is the program counter, which can also be specified as "pc".


## Addressing modes

I would like to support the following addressing modes.

| Name        | Example | Explanation |
| ----------- | ----- | ----- |
| register    | r0    | data from/to register |
| register indirect   | (r0) | The address of the data is in the register |
| register indirect postincrement | (r0)+ | The address of the data is in the register. After accessing the data the register is incremented |
| register indirect predecrement | -(r0) | The register is decremented, then the address in the register is used to access the data |
| register indirect indexed | (r0+r1) | The content of the registers is added. The result is the address of the data |
| immediate           | value | This is not a real mode; it is indirect postincrement of the PC. |
| immediate indirect  | (value) | The value is a memory address, the data is the data at that address |
| register indirect with offset | (r0+12)  | The literal offset plus the register value are added; the result is an address which contains the data.

## Addressing mode representation in instructions

We need 3 bits to define the addressing mode (am).

The move instruction could be:

01 [src am] [dst am]










## Instruction set bitness




