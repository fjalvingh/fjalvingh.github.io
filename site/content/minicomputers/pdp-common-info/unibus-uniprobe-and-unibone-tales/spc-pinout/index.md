# SPC Pinout

# Unibus SPC Slot Signal Assignments

Source: <https://chdickman.com/pdp11/Notes/DD11.shtml> (SPC Pin Designations, rows C–F).

Pin names use DEC numbering: slot row + pin letter + side (e.g. CF1 = row C, pin F, side 1). TP = test point.

Note: the source table contains some apparent anomalies (e.g. A SEL 4 on three pins, D02–D08 L duplicated in rows C and F, and entries such as "F01 N1" / "F01 F01"). They are reproduced exactly as published.

## Pin → Signal

| Pin | C1 | C2 | D1 | D2 | E1 | E2 | F1 | F2 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A | NPG IN | +5V | TP | +5V | GND | +5V | ABG OUT | +5V |
| B | NPG OUT | -15V | TP | -15V | ASSYN IN H | -15V | ABG IN | -15V |
| C | PA L | GND | A SEL 6 | GND | A12 L | GND | SSYN L | GND |
| D | LTC | D15 L | A OUT L | BR7 L | A17 L | A15 L | BBSY L | F01 N1 |
| E | TP | D14 L | A SEL 4 | BR6 L | MSYN L | A16 L | F01 V2 | D02 L |
| F | TP | D13 L | A SEL 0 | BR5 L | A02 L | C1 L | D05 L | D06 L |
| H | D11 L | D12 L | A IN | BR4 L | A01 L | A00 L | D07 L | A INT ENBB |
| J | A INT B | D10 L | A SEL 4 | A BR OUT | SSYN L | C0 L | NPR L | GND A |
| K | TP | D09 L | A OUT | BG7 SO | A14 L | A13 L | D08 L | A INT B |
| L | A INT ENBB | D08 L | INIT L | BG7 OUT | A11 L | TP | D03 L | F01 L2 |
| M | TP | D07 L | A INT ENBA | BG6 SO | A IN | A OUT H | INTR L | F01 M2 |
| N | DC LO | D04 L | A INT A | BG6 OUT | A OUT L | A08 L | F01 N1 | D04 L |
| P | HALT REQ | D05 L | TP | BG5 SO | A10 L | A07 L | ABR OUT | F01 P2 |
| R | HALT GRT | D01 L | TP | BG5 OUT | A09 L | A SEL 4 | F01 L2 | F01 N1 |
| S | PB L | D00 L | TP | BG4 SO | A SEL 6 | A SEL 0 | F01 M2 | F01 P2 |
| T | GND | D03 L | GND | BG4 OUT | GND | A SEL 2 | GND | SACK L |
| U | +15/+8 | D02 L | TP | ABG IN | A06 L | A04 L | A INT A | ABR OUT |
| V | AC LO | D06 L | ASSYN IN H | ABG OUT | A05 L | A03 L | A INT ENBA | F01 F01 |

## Signal → Pin(s)

| Signal | Pin(s) |
| --- | --- |
| +15/+8 | CU1 |
| +5V | CA2, DA2, EA2, FA2 |
| -15V | CB2, DB2, EB2, FB2 |
| A BR OUT | DJ2 |
| A IN | DH1, EM1 |
| A INT A | DN1, FU1 |
| A INT B | CJ1, FK2 |
| A INT ENBA | DM1, FV1 |
| A INT ENBB | CL1, FH2 |
| A OUT | DK1 |
| A OUT H | EM2 |
| A OUT L | DD1, EN1 |
| A SEL 0 | DF1, ES2 |
| A SEL 2 | ET2 |
| A SEL 4 | DE1, DJ1, ER2 |
| A SEL 6 | DC1, ES1 |
| A00 L | EH2 |
| A01 L | EH1 |
| A02 L | EF1 |
| A03 L | EV2 |
| A04 L | EU2 |
| A05 L | EV1 |
| A06 L | EU1 |
| A07 L | EP2 |
| A08 L | EN2 |
| A09 L | ER1 |
| A10 L | EP1 |
| A11 L | EL1 |
| A12 L | EC1 |
| A13 L | EK2 |
| A14 L | EK1 |
| A15 L | ED2 |
| A16 L | EE2 |
| A17 L | ED1 |
| ABG IN | DU2, FB1 |
| ABG OUT | DV2, FA1 |
| ABR OUT | FP1, FU2 |
| AC LO | CV1 |
| ASSYN IN H | DV1, EB1 |
| BBSY L | FD1 |
| BG4 OUT | DT2 |
| BG4 SO | DS2 |
| BG5 OUT | DR2 |
| BG5 SO | DP2 |
| BG6 OUT | DN2 |
| BG6 SO | DM2 |
| BG7 OUT | DL2 |
| BG7 SO | DK2 |
| BR4 L | DH2 |
| BR5 L | DF2 |
| BR6 L | DE2 |
| BR7 L | DD2 |
| C0 L | EJ2 |
| C1 L | EF2 |
| D00 L | CS2 |
| D01 L | CR2 |
| D02 L | CU2, FE2 |
| D03 L | CT2, FL1 |
| D04 L | CN2, FN2 |
| D05 L | CP2, FF1 |
| D06 L | CV2, FF2 |
| D07 L | CM2, FH1 |
| D08 L | CL2, FK1 |
| D09 L | CK2 |
| D10 L | CJ2 |
| D11 L | CH1 |
| D12 L | CH2 |
| D13 L | CF2 |
| D14 L | CE2 |
| D15 L | CD2 |
| DC LO | CN1 |
| F01 F01 | FV2 |
| F01 L2 | FL2, FR1 |
| F01 M2 | FM2, FS1 |
| F01 N1 | FD2, FN1, FR2 |
| F01 P2 | FP2, FS2 |
| F01 V2 | FE1 |
| GND | CC2, CT1, DC2, DT1, EA1, EC2, ET1, FC2, FT1 |
| GND A | FJ2 |
| HALT GRT | CR1 |
| HALT REQ | CP1 |
| INIT L | DL1 |
| INTR L | FM1 |
| LTC | CD1 |
| MSYN L | EE1 |
| NPG IN | CA1 |
| NPG OUT | CB1 |
| NPR L | FJ1 |
| PA L | CC1 |
| PB L | CS1 |
| SACK L | FT2 |
| SSYN L | EJ1, FC1 |
| TP | CE1, CF1, CK1, CM1, DA1, DB1, DP1, DR1, DS1, DU1, EL2 |