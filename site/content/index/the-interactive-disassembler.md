# The Interactive Disassembler

I ran into trouble when testing things on the Unibone for my PDP-11. One of the tests threw an illegal instruction trap, and I did not have the source code for the test..

This started an attempt to build as quickly as possible an interactive disassembler. The code is written in Java, uses Swing as the UI, so that it can be used everywhere. It is written in such a way that I can easily add other CPUs to disassemble too, but for now it’s pdp-11 only.

## Why not use Ghidra?

Ghidra is a nice product, but just studying what needs to be done to implement a new architecture/cpu there takes already more time than writing this simple thing from scratch..

## Where can I find it?

The code [can be found on Github](https://github.com/fjalvingh/idasm). Remember that it is a work in progress, currently.

# Change log

| **When** | **What** |
| --- | --- |
| 20250114 | Documentation updated |
| 20250113 | Implemented line comments and block comments; added ILoadFormat to load from different input file formats |
| 20250110 | Rewrite renderer to render into a Display model so that we can click on things :wink: |
| 20241218 | Started, implement the pdp11 disassembly module |