# Unibus board list


!i tbd, boards I have or that I would like to have, with relevant info

Check [Henk's board list](https://www.pdp-11.nl/fieldguide.html) for details.

## PDP 11/44

| Want/#Have | Board       | Number | Description |
| ---------- | --------    | ------ | --- |
| Want       | KE44-A      | M7091  | 11/44 CIS Control Store |
| Want       | KE44-A/2    | M7092  | 11/44 CIS Data Path / Logic module |
| 2          | PF11-F      | M7093  | 11/44 Floating Point |
| 2          | KD11-Z      | M7094  | 11/44 Data Path module |
| 2          | KD11-Z      | M7095  | 11/44 Control module |
| 2          | KD11-Z      | M7096  | 11/44 Multifunction module |
| 2          | KK11-B      | M7097  | 11/44 4KWord cache module |
| 2          | KD11-Z      | M7098  | 11/44 UNIBUS Interface |
| 4          | MS11-PB     | M8743  | 512KB ECC RAM (AA) |


## PDP 11/10 (11/05)

| Want/#Have | Board       | Number | Description |
| ---------- | --------    | ------ | --- |
| 2          | ?????       | G109C  | Unknown, but also mentions "control and data loops" |
| 2          | MM11-L      | G110   | Control and data loops for H214
| 2          | ML11-L      | G231E  | Memory driver for H214, 16K X/Y Selection, Current source, Address Latch, 8K Decode |
| 4          | MM11-L      | H214   | 8-Kword 16-bit memory stack (with G110 and G231) (replaced by H215) |
| 4          | KD11-B      | M7260  | 11/05 data path module |
| 3          | KD11-B      | M7261  | 11/05 control module |

Extra Backplane: MM11-5


## Common DEC cards

| Want/#Have | Board       | Number | Description |
| ---------- | --------    | ------ | --- |
| 2          | DHU11-M     | M3105  | 16 line async NUX with DMA |
| 1          | DELUA       | M7521  | Ethernet interface |
| 2          | RL11        | M7762  | RL02 Disk controller. Both repaired. |
| 2          | DZ11-A      | M7819  | 8-line double buffered async rs232/EIA with modem control  |
| Want       | DL11-W      | M7856  | Serial line unit w/ real time clock |
| 1          | RX211       | M8256  | RX02 floppy disk interface, repaired |
| 1          | H317-E      |        | RS232/EIA Distribution panel (16x) |
| 2          | CR-11/CM-11 | M8291  | [Card reader controller (punch card reader)](card-reader.png) |
| --------- | --------- | ------- | ------- |
| 2          | DiodeRom    | M792   | 32-word 16bit ROM Diode matrix |
| 1          | Terminator  | M9312  | Bootstrap terminator with 5 empty ROM sockets; one for CPU diagnostics, 4 for peripheral boots |
| 2          | DL11        | M7800  | Async transmitter & receiver 110-2400baud |
| 7          | DR11-C      | M7860  | M786+M105+M7821; general device interface to PDP11 |


## Emulex

| Want/#Have | Board    | Description |
| ---------- | -------- | ----------- |
| 2          | TC12     | Pertec tape controller |





