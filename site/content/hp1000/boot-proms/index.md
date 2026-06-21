# Installed boot PROMs

The IBL PROMs can be found by removing a few of the lower CPU cage cards. This then allows access to two of the boot PROMs in location U216 and U196.

The boot PROMs are N82S129 PROMs which are 256x4 bit model. These can actually be read with an TL 866II+.

## U216

The U216 slot contained the following:

```
00000000  08 05 04 01 08 00 02 04  00 0c 04 09 08 00 02 01
00000010  00 03 01 04 03 07 0e 04  07 07 0e 04 01 0f 0e 0e
00000020  08 05 04 08 08 02 01 07  00 04 00 09 02 0f 0c 08
00000030  08 0f 0c 00 01 0f 0e 0e  00 04 0c 00 01 0f 0e 0e
00000040  06 07 0f 0e 08 05 08 06  08 0d 0c 02 06 07 0d 0d
00000050  08 05 08 02 06 07 0e 00  08 05 0c 02 08 05 08 02
00000060  08 07 0c 06 08 04 08 06  09 0f 0e 08 08 04 0c 08
00000070  02 0f 0d 09 08 04 00 09  00 01 0b 0f 00 01 0d 0f
00000080  0f 0d 09 04 00 01 02 00  00 01 06 08 00 00 00 00
00000090  00 02 00 00 00 01 0b 0f  00 01 04 00 08 01 0e 00
000000a0  08 04 02 0d 00 08 00 03  00 00 02 07 00 08 00 03
000000b0  00 01 00 0b 00 02 00 0d  00 00 00 00 08 0f 0c 08
000000c0  06 07 0e 09 08 05 08 08  08 05 0c 08 03 0f 0f 00
000000d0  00 04 0a 00 0a 0f 0e 0e  06 07 0d 0e 03 0f 0f 06
000000e0  08 05 08 08 00 04 01 01  02 0f 0f 06 08 04 0c 08
000000f0  02 0f 0f 0b 02 0f 0e 0f  00 00 00 08 0f 00 04 00
```
MD5 hashed to 13b3a1d34298c3b8f7f095f6a723baa0 which resolves to 12992-80004.bin, which is the 12992H loader ROM, used for disk models 7906H, 7920H, 7925H and 9895; all using the 12821A HP-IB (ICD) interface.

## U196

The U196 slot contained:

```
00000000  00 00 00 00 00 00 00 00  00 00 0c 0c 00 06 00 04
00000010  07 07 0f 0d 06 0f 0f 0a  01 0f 0f 02 08 04 0c 09
00000020  02 0f 0c 07 06 0f 0f 0c  03 0f 0f 0d 02 0f 0c 06
00000030  06 0f 0f 0b 01 0f 0f 02  08 07 0c 08 08 04 08 09
00000040  02 0f 0e 0a 08 04 0c 08  02 0f 0c 0f 08 0f 04 08
00000050  00 0b 0d 07 00 0e 00 00  07 0f 0f 0d 08 04 08 09
00000060  02 0f 0e 0a 08 04 0c 08  02 0f 0d 07 08 0f 04 08
00000070  07 08 00 00 07 0f 0f 02  02 0f 0e 02 0f 0f 0f 02
00000080  04 00 00 01 03 0f 0f 02  08 04 0c 08 02 0f 0e 02
00000090  08 0f 04 08 03 0f 0f 0d  02 0f 0d 0f 05 08 00 00
000000a0  02 0f 0c 0f 08 04 00 09  08 05 04 09 00 03 0d 07
000000b0  00 04 01 00 08 04 03 0f  00 03 0d 07 00 02 0c 08
000000c0  08 04 00 00 02 0f 0c 0c  00 00 00 00 08 0d 08 09
000000d0  08 05 04 09 00 02 0d 03  00 02 0c 08 02 0f 0f 03
000000e0  08 07 0c 09 0a 0f 0f 02  00 03 04 01 00 03 01 03
000000f0  00 00 08 03 00 00 00 00  00 00 00 00 00 00 00 00
```
which hashes to 2e1826652c7a37b59e66f20b4b262b74. There is no direct match with the known boot PROMs.

With a lot of help from Claude this PROM was identified as the HP 12992D loader ROM: the 7970B/7970E 9‑track magnetic‑tape absolute binary loader (HP part 12992‑80006) - with a small change.

```
IDENTITY:  HP 12992D -- 7970B/7970E 9-track MAGNETIC TAPE absolute binary loader
           (HP part 12992-80006).  Interface: 13181A (7970B) / 13183A (7970E).
           Interface select codes used: 10B = data channel ("DC"),
                                        11B = command channel ("CC").

Words 07703-07777 are BYTE-IDENTICAL to the published 12992D listing.
Words 07700-07702 DIFFER (see *** below): the switch-register "file-forward
select" entry of 12992D is absent here (first 10 PROM nibbles read as zero).

addr   octal   mnemonic        12992D label / comment
-----  ------  --------------  ---------------------------------------------
*** ENTRY DIFFERS FROM PUBLISHED 12992D ***
07700  000000  NOP             (12992D: 106501  LIB 1   = read switch register)
07701  000000  NOP             (12992D: 006011  SLB,RSS = file-forward requested?)
07702  000314  SLA             (12992D: 027714  JMP NRD = no, just read a file)
*** body below matches 12992D exactly ***
07703  003004  CMA,INA         make file-forward request negative for counter
07704  073775  STA  WCT        save file counter (WCT=07775)
07705  067772  LDB  SLORW      select unit 0 and rewind  (SLORW=07772)
07706  017762  JSB  CMD        FFL: output command to drive (CMD=07762)
07707  102311  SFS  CC         wait for command completion (CC=11B)
07710  027707  JMP  *-1
07711  067774  LDB  FFC        get file-forward command   (FFC=07774)
07712  037775  ISZ  WCT        bump file counter
07713  027706  JMP  FFL        do file forward
07714  067773  LDB  RDCMD      NRD: get read command      (RDCMD=07773)
07715  017762  JSB  CMD        issue it
07716  103710  STC  DC,C       start data channel (DC=10B)
07717  102211  SFC  CC         check for status
07720  027752  JMP  STAT       (STAT=07752)
07721  102310  SFS  DC         any data?
07722  027717  JMP  *-3
07723  107510  LIB  DC,C       get record count (lower byte)
07724  005727  BLF,BLF
07725  007000  CMB
07726  077775  STB  WCT        save input count
07727  102211  SFC  CC         check for status
07730  027752  JMP  STAT
07731  102310  SFS  DC         wait to read next word
07732  027727  JMP  *-3
07733  107510  LIB  DC,C       get load address
07734  074000  STB  0          start checksum
07735  077762  STB  CMD        and address pointer (CMD=07762)
07736  027742  JMP  *+4
07737  177762  STB  CMD,I      NWD: put word in memory
07740  040001  ADA  1          add it to checksum
07741  037762  ISZ  CMD        move up address
07742  102310  SFS  DC         wait for next word
07743  027742  JMP  *-1
07744  107510  LIB  DC,C       get data to store in memory
07745  037775  ISZ  WCT        finished with data?
07746  027737  JMP  NWD        no, read next word
07747  054000  CPB  0          is checksum OK?
07750  027717  JMP  NRD+3      yes - wait for cmd channel status (NRD+3=07717)
07751  102011  HLT  11B        no -- error halt
07752  102511  LIA  CC         STAT: get status
07753  001727  ALF,ALF         position EOF bit
07754  002020  SSA
07755  102077  HLT  77B        end-of-file halt
07756  001727  ALF,ALF
07757  001310  RAR,SLA
07760  102000  HLT  0
07761  027714  JMP  NRD        read next record
-- constants / subroutine ----------------------------------------------
07762  000000  CMD  NOP        (command-output subroutine entry / address temp)
07763  106611  OTB  CC         output command
07764  102511  LIA  CC         check if rejected
07765  001323  RAR,RAR
07766  001310  RAR,SLA
07767  027763  JMP  *-4        yes, try again
07770  103711  STC  CC,C       no, start command
07771  127762  JMP  CMD,I      return
07772  001501  =OCT 1501       SLORW: MT select 0 / rewind command
07773  001423  =OCT 1423       RDCMD: MT read-a-record command
07774  000203  =OCT 0203       FFC:   MT file-forward command
07775  000000  =OCT 0          WCT:   input word/file count (variable)
07776  000000  =OCT 0
07777  000000  =OCT 0
```

