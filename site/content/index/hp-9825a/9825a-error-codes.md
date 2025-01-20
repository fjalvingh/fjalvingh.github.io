# 9825A Error codes

Copy from the error codes booklet

\*: these errors give a cursor in the line when the RECALL button is pressed, indicating the location of the error in the line.

| **Code** | **Desc** |
| --- | --- |
| 00  | System Error |
| 01  | Unexpected peripheral interrupt |
| 02\* | Unterminated text |
| 03\* | Mnemonic is unknown |
| 04  | System is secured |
| 05  | Operation not allowed; line cannot be stored; executed with line number |
| 06\* | Syntax error in number |
| 07\* | Syntax error in input line |
| 08  | Internal representation of the line is too long (gives cursor sometimes) |
| 09  | Gto, gsb, or end statement not allowed in present context (1: see also Advanced Programming ROM error messages) |
| 10\* | Gto or gsb statement requires an integer |
| 11  | Integer out of range or integer required. Must be between -32768 and 32767 |
| 12\* | Line cannot be stored; can only be executed |
| 13  | Enter (ent) statement not allowed in current context |
| 14  | Program structure destroyed |
| 15  | Printer out of paper or printer failure |
| 16  | String variables ROM not present for the string comparison. Argument in relational comparison operator not allowed. |
| 17  | Parameter out of range |
| 18  | Incorrect parameter |
| 19  | Bad line number |
| 20  | Missing ROM or binary program. The second number indicates the missing ROM. In the program mode, the line number is given instead of the ROM number.<br><br>1: Binary Program  <br>4: Systems Programming  <br>6: Strings  <br>8: Extended I/O  <br>9: Advanced programming  <br>10: Matrix  <br>11: Plotter (9862A or 9872A)  <br>12: General I/O  <br>15: 9885 Disk |
| 21  | Line is too long to store |
| 22  | Improper dimension specification |
| 23  | Simple variable already allocated |
| 24  | Array already dimensioned |
| 25  | Dimensions of array disagree with number of subscripts |
| 26  | Subscript of array element out of bounds |
| 27  | Undefined Array |
| 28  | Ref statement has no matching gsb statement |
| 29  | Cannot execute line because a ROM or binary program is missing |
| 30  | Special function key not defined |
| 31  | Non-existent program line |
| 32  | Improper data type (1: see also Advanced Programming ROM error messages) |
| 33  | Data types do not match in assignment statement |
| 34  | Display overflow due to pressing a special function key |
| 35  | Improper flag reference (no such flag) |
| 36  | Attempt to delete destination of a gto or gsb statement |
| 37  | Display buffer overflow caused by display (dsp) statement |
| 38  | Insufficient memory for subroutine return pointer (1) |
| 39  | Insufficient memory for variable allocation or binary program |
| 40  | Insufficient memory for operation |
| 41  | No cartridge in tape transport |
| 42  | Tape cartridge is write protected |
| 43  | Unexpected Beginning-of-tape (BOT) or End-of-tape (EOT) marker encountered, or a tape transport failure |
| 44  | Verify has failed |
| 45  | Attempted execution of idf statement without parameters, or mkr statement when tape position is unknown |
| 46  | Read error of file body (See appendix F) |
| 47  | Read error of file head (see appendix F) |
| 48  | End-of-tape (EOT) encountered before specified number of files were marked |
| 49  | File too small |
| 50  | Ldf statement for a program file must be the last statement in the line |
| 51  | A ROM is present but was not when the memory was recorded. Remove the ROM indicated by the number to the right of the error number in the display, and re-execute the ldm statement. In the program mode, the line number is given instead of the ROM number. See error 20 for a list of ROM numbers. |
|     |     |