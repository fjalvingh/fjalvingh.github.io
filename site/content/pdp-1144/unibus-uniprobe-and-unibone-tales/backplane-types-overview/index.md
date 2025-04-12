# Backplane types - overview

# PDP-11 chassis and backplanes

* * *

## Unibus

| model | height | power supply | backplane | usage |
| --- | --- | --- | --- | --- |
| BA11-A | 10.5 in | H7140,  <br>opt. H7750-B BBU |     | PDP-11/24, PDP-11/44, VAX-11/730 |
| BA11-B |     |     |     | PDP-11/35 |
| BA11-C | 10.5 in | H720 |     | PDP-11/20 |
| BA11-D | 10.5 in | H750 |     | PDP-11/05, PDP-11/10, PDP-11/35 |
| BA11-E | 10.5 in | H720 |     | PDP-11/05, PDP-11/20 expansion box, rack -ES, tabletop -EC |
| BA11-F | 21 in | two H742 or H7420 |     | PDP-11/40, PDP-11/45, PDP-11/70, Unibus expansion - cards pull out left |
| BA11-G | 7.5 in |     | DDV11-E | tabletop box w/ L-H Research power supply |
| BA11-J |     | n/a | n/a | strong cover for table top PDP-11/05 |
| BA11-K | 10.5 in | H765 |     | PDP-11/05, PDP-11/34, PDP-11/35, Unibus expansion, MJ11, MK11 |
| BA11-L | 5.25 in | H777 |     | PDP-11/04, 11/24 |
| BA11-P |     | two H7420,  <br>opt. H775 BBU |     | PDP-11/60, PDP-11/60 expansion box, 11D34 |
| BA11-Y | 10.5 in |     |     | DYS50 |
| BA11-Z |     |     |     | VAX-11/730 |
| BB11 |     |     |     | four slot blank mounting panel (backplane w/ Unibus and power only) |

Note that the H742/H7420 bulk power supply use up to five regulator assemblies (max four for the H7420-E and H7420-F) of various types, the H750 uses one regulator, and the H765 uses two regulators:

|     |     |     |
| --- | --- | --- |
| H744 | +5V 25A |     |
| H745 | \-15V 10A |     |
| H746 | +23.2V 1.6A, +19.7V 3.3A, -5V 1.6A | used for MOS memory in 11/45 |
| H754 | +20V 8A, -5V 1-8A | used for MF11-U/UP |
| H770 | +15V 10A |     |
| H781 | +5V 15-25A, +15V 4A | H7440 with added +15V regulator and LTC output |
| H7440 | +5V 25A |     |
| H7441 | +5V 32A |     |
| H7850 | +5V 2.5A, +12V 0.1A, -12V 0.15A | used for MOS memory, supports H775 battery backup |
| 70-14251 | +5V, +12V, -12V |     |

* * *

## Unibus Backplanes

| model | organization |
| --- | --- |
| DD11-A | four SPC, AB slots in middle for power (BA11-C) |
| DD11-B | four SPC, AB slots in middle for two DF11 |
| DD11-CF | four SPC, power harness for BA11-F |
| DD11-CK, 54-11560 | four SPC, power harness for BA11-K |
| DD11-DF | nine SPC, power harness for BA11-F |
| DD11-DK, 54-11414, 70-11164-00 | nine SPC, power harness for BA11-K |
| DD11-PK 70-11523 | 11/04, 11/34, 11/34a backplane |
| 70-16905 | PDP-11/24, M7133 KDF11-UA processor in slot 1  <br>M7134 KT24 Unibus map in slot 2 CDEF (no grant)  <br>extended Unibus in slots 2-6 AB  <br>modified Unibus in slots 7-8 AB  <br>Unibus in alot 9 AB  <br>SPC in slots 3-6, 9 CDEF  <br>NPR SPC in slots 7-8 CDEF (use G7273 grant in CD) |
| 70-16502 | PDP-11/44 KD11-Z processor |
| H9277-A, 54-15658, 70-20650-01 | PDP-11/84 |
| DH11-XX, 54-10333, 70-09561 | DH11 |
| MM11-S | MM11-L |
| PCL11-BP, 70-07204, 76-06675-A | PCL11-B |
| RH11-BP | RH11 |

* * *

## Qbus

| model | height | backplane | organization | power supply | used in |
| --- | --- | --- | --- | --- | --- |
| BA11-M | 3.5 in | DDV11-A, H9270 | 4 Q18-Q18 | H780 | PDP-11/03 |
| BA11-N | 5.25 in | H9273 | 9 Q18-CD | H786, H7861 | PDP-11/23 |
| H9275 | 9 Q22-Q22 | H786, H7861 | PDP-11/23 |
| BA11-R | 5.25 in | H9273 | 9 Q18-CD | H786, H7861 | PDP-11/23 |
| BA11-S | 5.25 in | H9276 | 9 Q22-CD | H7861 | PDP-11/23+ |
| BA11-U | 15.75 in | 3\*H9270 |     |     | PDP-11/03 in VAX-11/780 |
| BA11-VA | 3.6 in | H9281-BA | 2 Q18-Q18 |     |     |
| BA11-VB | 3.6 in | H9281-AB | 4 Q18-Q18 |     |     |
|     |     | H9281-AC | 6 Q18-Q18 |     |     |
|     |     | H9281-QA | 2 Q22-Q22 |     |     |
|     |     | H9281-QB | 4 Q22-Q22 |     |     |
|     |     | H9281-QC | 6 Q22-Q22 |     |     |
| BA11-W | 5.25 in |     |     |     | PDP-11/23-AH |
| BA23 |     | H9278 | 3 Q22-CD, 5 Q22-Q22 | H7864, H7864-A | MicroPDP-11 |
| BA123 "world box" |     | 70-22019-00 pwb,  <br>54-17507-01 assy | 4 Q22-CD, 8 Q22-Q22 | H7260, H7261 |     |
|     |     | DDV11-B | 6 hex, ABCD are Q18-Q18 |     |     |
|     |     | DDV11-CK, 54-13036 assy |     |     |     |
| VT103 |     | 54-14008 | 4 Q18-Q18 | H7835 |     |
