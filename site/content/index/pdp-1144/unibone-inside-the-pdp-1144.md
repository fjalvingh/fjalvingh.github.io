# Unibone inside the PDP-11/44

The first experiments with the Unibone in the PDP..

Placed in the but last slot because that has NPR cut. Start the machine, connect to the Unibone and start the “demo.sh” program to check memory:

```
Have fun with UniBone !

Last login: Sun May 21 16:30:51 2023
root@unibone:~# ./demo.sh 
iarg1=8, iarg2=15
[16:31:08.914926 Inf    APP] Printing verbose output.
demo  - QUniBone UNIBUS test application.
    Version DBG v1.5.0, compile Feb 14 2023 15:41:35.
[16:31:08.919726 Inf    APP] Registering Non-PRU GPIO pins.
[16:31:08.921075 Inf  GPIOS] GPIO0 registers at 44E07000 - 44E07FFF (size = 1000)
[16:31:08.922746 Inf  GPIOS] GPIO1 registers at 4804C000 - 4804CFFF (size = 1000)
[16:31:08.924158 Inf  GPIOS] GPIO2 registers at 481AC000 - 481ACFFF (size = 1000)
[16:31:08.925505 Inf  GPIOS] GPIO3 registers at 481AE000 - 481AEFFF (size = 1000)
[16:31:08.939466 Inf    APP] Disable DS8641 drivers.
[16:31:08.953588 Inf    APP] Leave SYSBOOT mode.


*** QUniBone UNIBUS technology demonstrator build Feb 14 2023 16:02:43

tg          Test of single non-PRU GPIO pins
tp          Test I2C paneldriver
tl          Test of IO bus latches
bs          Stimulate UNIBUS bus signals
tm          Test Bus Master: access UNIBUS address range without PDP-11 CPU arbitration
ts          Test shared DDR memory = UNIBUS memory as BUS SLAVE
ti          Test Interrupts (needs physical PDP-11 CPU)
d           Emulate devices, with PDP-11 CPU arbitration
dc          Emulate devices and CPU, PDP-11 must be disabled.
m           Full memory slave emulation with DMA bus master functions by PDP-11 CPU.
i           Info, help
q           Quit

>>>m
[16:31:10.326005 Inf    APP] Connecting to PRU.
[16:31:10.330388 Inf DDRMEM] Shared DDR memory: 4194304 bytes available, 4194304 bytes needed.
[16:31:10.330759 Inf DDRMEM]   Virtual (ARM Linux-side) address: 0xb4758000
[16:31:10.331002 Inf DDRMEM]   Physical (PRU-side) address:9d100000
[16:31:10.331234 Inf DDRMEM]   4194304 bytes of UniBone memory allocated
[16:31:10.334128 Inf    PRU] Loaded and started PRU code with id = 2
[16:31:10.438275 Inf    APP] Registering non-PRU pins.
[16:31:10.440948 Inf  GPIOS] GPIO0 registers at 44E07000 - 44E07FFF (size = 1000)
[16:31:10.443731 Inf  GPIOS] GPIO1 registers at 4804C000 - 4804CFFF (size = 1000)
[16:31:10.446135 Inf  GPIOS] GPIO2 registers at 481AC000 - 481ACFFF (size = 1000)
[16:31:10.448485 Inf  GPIOS] GPIO3 registers at 481AE000 - 481AEFFF (size = 1000)
[16:31:10.459101 Inf    APP] Disable DS8641 drivers.
[16:31:10.462364 Inf    APP] Leave SYSBOOT mode.
[16:31:10.464873 Inf    APP] Registering multiplex bus latches, initialized later by PRU code.
[16:31:10.467139 Inf    APP] Initializing device register maps.
[16:31:10.470287 Inf QUNAPT] QUnibusAdapter: Registering device Test controller
[16:31:10.476300 Inf QUNAPT] QUNIBUSADAPTER::worker(0) started
[16:31:10.479491 Inf QUNAPT] Trying to set thread realtime priority = 50
[16:31:10.482496 Inf QUNAPT] Scheduling is at RT priority.
[16:31:10.482878 Inf QUNAPT] Thread priority is 50

     UNIBUS devices are clients to PDP-11 CPU acting as NPR/INTR Arbitrator
    (CPU active, console processor inactive).
    CPU is physical or emulated.
    Memory access as Bus Master with NPR/NPG/SACK handshake.
	UniBone does not emulate memory.
***
*** Starting full UNIBUS master/slave logic on PRU
***
Device registers by IO page address:
io760200=reg[ 1] cur val=000000, writable=177777. active iopage reg with handle 1 linked to device Test controller reg[CSR]
io760202=reg[ 2] cur val=000000, writable=177777. active iopage reg with handle 2 linked to device Test controller reg[reg01]
io760204=reg[ 3] cur val=000000, writable=177777. active iopage reg with handle 3 linked to device Test controller reg[reg02]
io760206=reg[ 4] cur val=000000, writable=177777. active iopage reg with handle 4 linked to device Test controller reg[reg03]
io760210=reg[ 5] cur val=000000, writable=177777. active iopage reg with handle 5 linked to device Test controller reg[reg04]
io760212=reg[ 6] cur val=000000, writable=177777. active iopage reg with handle 6 linked to device Test controller reg[reg05]
io760214=reg[ 7] cur val=000000, writable=177777. active iopage reg with handle 7 linked to device Test controller reg[reg06]
io760216=reg[ 8] cur val=000000, writable=177777. active iopage reg with handle 8 linked to device Test controller reg[reg07]
io760220=reg[ 9] cur val=000000, writable=177777. active iopage reg with handle 9 linked to device Test controller reg[reg10]
io760222=reg[10] cur val=000000, writable=177777. active iopage reg with handle 10 linked to device Test controller reg[reg11]
io760224=reg[11] cur val=000000, writable=177777. active iopage reg with handle 11 linked to device Test controller reg[reg12]
io760226=reg[12] cur val=000000, writable=177777. active iopage reg with handle 12 linked to device Test controller reg[reg13]
io760230=reg[13] cur val=000000, writable=177777. active iopage reg with handle 13 linked to device Test controller reg[reg14]
io760232=reg[14] cur val=000000, writable=177777. active iopage reg with handle 14 linked to device Test controller reg[reg15]
io760234=reg[15] cur val=000000, writable=177777. active iopage reg with handle 15 linked to device Test controller reg[reg16]
io760236=reg[16] cur val=000000, writable=177777. active iopage reg with handle 16 linked to device Test controller reg[reg17]
io760240=reg[17] cur val=000000, writable=177777. active iopage reg with handle 17 linked to device Test controller reg[reg20]
io760242=reg[18] cur val=000000, writable=177777. active iopage reg with handle 18 linked to device Test controller reg[reg21]
io760244=reg[19] cur val=000000, writable=177777. active iopage reg with handle 19 linked to device Test controller reg[reg22]
io760246=reg[20] cur val=000000, writable=177777. active iopage reg with handle 20 linked to device Test controller reg[reg23]
io760250=reg[21] cur val=000000, writable=177777. active iopage reg with handle 21 linked to device Test controller reg[reg24]
io760252=reg[22] cur val=000000, writable=177777. active iopage reg with handle 22 linked to device Test controller reg[reg25]
io760254=reg[23] cur val=000000, writable=177777. active iopage reg with handle 23 linked to device Test controller reg[reg26]
io760256=reg[24] cur val=000000, writable=177777. active iopage reg with handle 24 linked to device Test controller reg[reg27]
io760260=reg[25] cur val=000000, writable=177777. active iopage reg with handle 25 linked to device Test controller reg[reg30]
io760262=reg[26] cur val=000000, writable=177777. active iopage reg with handle 26 linked to device Test controller reg[reg31]
io760264=reg[27] cur val=000000, writable=177777. active iopage reg with handle 27 linked to device Test controller reg[reg32]
io760266=reg[28] cur val=000000, writable=177777. active iopage reg with handle 28 linked to device Test controller reg[reg33]
io760270=reg[29] cur val=000000, writable=177777. active iopage reg with handle 29 linked to device Test controller reg[reg34]
io760272=reg[30] cur val=000000, writable=177777. active iopage reg with handle 30 linked to device Test controller reg[reg35]
io760274=reg[31] cur val=000000, writable=177777. active iopage reg with handle 31 linked to device Test controller reg[reg36]
io760276=reg[32] cur val=000000, writable=177777. active iopage reg with handle 32 linked to device Test controller reg[reg37]
Registered devices by handle:
Device #1 "Test controller" @io760200: 32 registers
  Reg[ 0]@io760200: active dati dato, resetval=000000, writable=177777.
  Reg[ 1]@io760202: active dati dato, resetval=000000, writable=177777.
  Reg[ 2]@io760204: active dati dato, resetval=000000, writable=177777.
  Reg[ 3]@io760206: active dati dato, resetval=000000, writable=177777.
  Reg[ 4]@io760210: active dati dato, resetval=000000, writable=177777.
  Reg[ 5]@io760212: active dati dato, resetval=000000, writable=177777.
  Reg[ 6]@io760214: active dati dato, resetval=000000, writable=177777.
  Reg[ 7]@io760216: active dati dato, resetval=000000, writable=177777.
  Reg[ 8]@io760220: active dati dato, resetval=000000, writable=177777.
  Reg[ 9]@io760222: active dati dato, resetval=000000, writable=177777.
  Reg[10]@io760224: active dati dato, resetval=000000, writable=177777.
  Reg[11]@io760226: active dati dato, resetval=000000, writable=177777.
  Reg[12]@io760230: active dati dato, resetval=000000, writable=177777.
  Reg[13]@io760232: active dati dato, resetval=000000, writable=177777.
  Reg[14]@io760234: active dati dato, resetval=000000, writable=177777.
  Reg[15]@io760236: active dati dato, resetval=000000, writable=177777.
  Reg[16]@io760240: active dati dato, resetval=000000, writable=177777.
  Reg[17]@io760242: active dati dato, resetval=000000, writable=177777.
  Reg[18]@io760244: active dati dato, resetval=000000, writable=177777.
  Reg[19]@io760246: active dati dato, resetval=000000, writable=177777.
  Reg[20]@io760250: active dati dato, resetval=000000, writable=177777.
  Reg[21]@io760252: active dati dato, resetval=000000, writable=177777.
  Reg[22]@io760254: active dati dato, resetval=000000, writable=177777.
  Reg[23]@io760256: active dati dato, resetval=000000, writable=177777.
  Reg[24]@io760260: active dati dato, resetval=000000, writable=177777.
  Reg[25]@io760262: active dati dato, resetval=000000, writable=177777.
  Reg[26]@io760264: active dati dato, resetval=000000, writable=177777.
  Reg[27]@io760266: active dati dato, resetval=000000, writable=177777.
  Reg[28]@io760270: active dati dato, resetval=000000, writable=177777.
  Reg[29]@io760272: active dati dato, resetval=000000, writable=177777.
  Reg[30]@io760274: active dati dato, resetval=000000, writable=177777.
  Reg[31]@io760276: active dati dato, resetval=000000, writable=177777.
sz                          Size memory: scan addresses from 0, show valid range
m [<startaddr> <endaddr>]   memory range emulated by UniBone. No args = all upper. [octal]
e <addr> [n]                EXAMINE the next <n> words at <addr>. [octal]
e                           EXAMINE single word from next <addr>
d <addr> <val> [<val> ..]   DEPOSIT multiple <val> starting at <addr> [octal]
d <val>                     DEPOSIT <val> into next <addr>
xe                          Like EXAM, but local access to DDR memory. Only in emulated memory range.
xd                          Like DEPOSIT, local access to DDR memory. (CPU cache not updated!)
lb <filename>               Load memory content from disk file, as binary image
ll <filename>               Load memory content from MACRO-11 listing
lp <filename>               Load memory content from Absolute Papertape image
lt <filename>               Load memory content from "adr-value pairs" text file
s <filename>                Save memory content to binary disk file
ta [<startaddr> <endaddr>]  Test memory, addr into each word. Max <endaddr> = 757776
tr [<startaddr> <endaddr>]  Test memory random
init                        Pulse UNIBUS INIT
pwr                         Simulate UNIBUS power cycle (ACLO/DCLO)
dbg c|s|f                   Debug log: Clear, Show on console, dump to File.
                               (file = qunibone.log.csv)
i                           Info about address tables
<  <filename>               Read command from <file>
q                           Quit
Current EXAM/DEPOSIT address is 000000

M>>>[16:31:10.496228 Inf     tc] Test controller::worker(0) started
[16:31:10.499867 Inf     tc] Trying to set thread realtime priority = 50
[16:31:10.502622 Inf     tc] Scheduling is at RT priority.
[16:31:10.502998 Inf     tc] Thread priority is 50


M>>>sz

Found valid addresses in range 0..757776.
Current EXAM/DEPOSIT address is 000000

M>>>e 0

EXAM 000000 -> 000000
Current EXAM/DEPOSIT address is 000000

M>>>d 0 123

DEPOSIT 000000 <- 000123
Current EXAM/DEPOSIT address is 000000

M>>>e 0 

EXAM 000000 -> 000123
Current EXAM/DEPOSIT address is 000000

M>>>tr

Testing 0..757776 randomly (stop with ^C) ...
WRWRWRWRWRWRWRWRWR 10 WRWRWRWRWRWRWRWRWRWR 20 WRWRWRWRWRWRWRWRWRWR 30 WRWRWRWRW
RWRWRWRWRWR 40 WRWRWRWRWRWRWRWRWRWR 50 WRWRWRWRWRWRWRWRWRWR 60 WRWRWRWRWRWRWRWR
WRWR 70 WRWRWRWRWRWRWRWRWRWR 80 WRWRWRWRWRWRWRWRWRWR 90 WRWRWRWRWRWRWRWRWRWR
 100 WRWRWRWRWRWRWRWRWRWR 110 WRWRWRWRWRWRWRWRWRWR 120 WRWRWRWRWRWRWRWRWRWR
 130 WRWRWRWRWRWRWRWRWRWR 140 WRWRWRWRWRWRWRWRWRWR 150 WRWRWRWRWRWRWRWRWRWR
 160 WRWRWRWRWRWRWRWRWRWR 170 WRWRWRWRWRWRWRWRWRWR 180 WRWRWRWRWRWRWRWRWRWR
 190 WRWRWRWRWRWRWRWRWRWR 200 WRWRWRWRWRWRWRWRWRWR 210 WRWRWRWRWRWRWRWRWRWR
 220 WRWRWRWRWRWRWRWRWRWR 230 WRWRWRWRWRWRWRWRWRWR 240 WRWRWRWRWRWRWRWRWRWR
 250 WRWRWRWRWRWRWRWRWRWR 260 WRWRWRWRWRWRWRWRWRWR 270 WRWRWRWRWRWRWRWRWRWR
 280 WRWRWRWRWRWRWRWRWRWR 290 WRWRWRWRWRWRWRWRWRWR 300 WRWRWRWRWRWRWRWRWRWR
 310 WRWRWRWRWRWRWRWRWRWR 320 WRWRWR^[W^[^[^[^[RWRWRWRWRWRWR 330 WRWRWRWRWRWRWRWRWRWR
 340 WR^C
All OK! Total 340 passes, split into 4807 block writes and 4984 block reads
Current EXAM/DEPOSIT address is 000000

```

This seems to work fine :wink: