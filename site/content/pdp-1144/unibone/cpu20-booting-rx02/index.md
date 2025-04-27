# Booting the CPU20 emulation from an emulated rx02 drive

Most of the Unibone scripts for the cpu20 emulation boot from an RL02 drive. This is nice, except when you want to run the xxdp tests for rl02 on a real device ;). I wanted to change the boot to rx02, and use one of the rx02 images from [ak6dk's collection of xxdp rx02 images](https://ak6dn.github.io/PDP-11/RX02/). Doing this was less than obvious, and I learned some thing along the way.

## The boot scripts

Let's start with the actual Unibone script that I ended up with

```
dc                      # "device + cpu" test menu

# Make a serial port.
sd dl11
en dl11                 # use emulated serial console
p p ttyS2               # use "UART2 connector, see FAQ
en kw11                 # enable KW11 on DL11-W

pwr
.wait 3000              # wait for PDP-11 to reset
m i                     # install max UNIBUS memory

# Deposit bootloader into memory
m ll dy.lst
en ry                   # enable RX11 controller
en rybox

sd rybox
p pwr 1                 # power-on drive box

sd ry0
p it0 1 # track 0 in image
p img 11XX_5.RX2  # insert floppy into drive #0
p emulation_speed 10    # 10x speed. Load disk in 5 seconds

.print Disk drive now on track after 5 secs
.wait   5000            # wait until drive spins up
p                       # show all params of RL1

en cpu20
sd cpu20

# For use with the extended instruction set patch, https://github.com/j-hoppe/QUniBone/pull/10
#p v 5
#p extended_inst 1
#p allow_mxps 1
#p pmi 1

init
# Set pc to 10000, the address of the dy.lst boot loader.
p pc 10000

.print Start from 0 or 10000 to boot from drive 0, 10010 for drive 1, ...
.print PC is set to 10000 now
.print Reload with "m ll"
.print Start the CPU by entering "p s 1"
```

There are a few things that were very non obvious from the existing scripts I used.

## How do enter the actual boot loader

The Unibone has several examples of boot loaders in the different application directories. These are often files that end in .lst. There was a "dy.lst" present, and it was used in a non-emulated cpu example (rt11.rx02), but when I copied the code there in a cpu20 example it failed with all kinds of cpu traps.

This was caused by the fact that by default the cpu20 emulation starts at address 0, and the boot loaders start at 10000. This was far from obvious as the existing examples just loaded things like "dl.lst" and started the CPU.. So why does a simple load of dy.lst not boot?

Looking at the start dl.lst gave the answer:
```
      22                                        .asect
      23                                        ; ---- Simple boot drive 0 from 0
      24 000000                                 . = 0
      25 000000 000137  010000                  jmp     @#start0
      26
```
I.e. that boot loader has an extra section adding a jump at 0. This is missing from the dy.lst loader, so just starting the CPU would execute undefined code at pc=0.

This made it clear that I needed to set PC=10000 before starting the CPU. But when asking for the cpu20 parameters it unhelpfully told me:
```
sd cpu20
p

PC                   pc     004154           read only  program counter helper register.                                                          
```
This was confusing, and I actually looked at the source code to see how that PC could be set. This turned out to be simple: the PC was set to readonly because the CPU was actually __running__ when I asked for the parameters, and when running you cannot change the PC value. When the CPU is halted you can change it.

This now made the boot work: just enable the cpu20 emulation, set the pc to 10000(oct) and do a "p s 1" to start the CPU at that address. And voila:
```
BOOTING UP XXDP-SM SMALL MONITOR


XXDP-SM SMALL MONITOR - XXDP V2.6
REVISION: E0
BOOTED FROM DY0
28KW OF MEMORY
UNIBUS SYSTEM

RESTART ADDRESS: 152010
TYPE "H" FOR HELP 

.
```
