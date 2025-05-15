# RL11 controller #2 - initial tests

Connecting the drive to this controller makes the drive not become ready. testing the clock signal at the drive showed that it did not arrive there. There was just a small error in the band cable, so that was fixed. After that let's run ZRLG. This fails with:

```
CZRLG DVC FTL ERR  00037 ON UNIT 00 TST 032 SUB 000 PC: 023054
BAD HEADER CRC ON READ HEADER
CONTROLLER: 174400  DRIVE: 0
BEFORE COMMAND: CS: 000211 BA: 002416 DA: 000001 MP: 004012
TIME OF ERROR:  CS: 000211 BA: 002416 DA: 000001 MP: 000007?
EXP'D: 072001 REC'D: 002001

ERR HLT
```
The fiche for the test is:

![Fiche test32-1](fiche-32-1.png)
![Fiche test32-2](fiche-32-2.png)

The test executes a READ HEADER command. It then reads the 1st two words from the MP register (the cylinder/track count in the first word and the second word is all zeroes). It calculates a checksum from these two words (in code) and the reads the 3rd word and compares it with the checksum. These should be equal but clearly are not.

This is hard to debug from just the LA trace, so I made a protocol decoder for Sigrok: [syncserial](../../../tools/saleae-decoders/index.md). This decoder decodes the data from the serial data stream so that we can more easily understand what we see. One such trace looks like this:

![read header trace 1](la-readheader-1.png)

We can see that the first word (sector/track) is 0xA000, the second word is all zeroes (which is according to spec) and the third word, the CRC, is 0x0033. This should translate to sector 320, head 0, sector 0.


## The CRC calculation

The CRC for the header gets calculated by the routine SIMBCC. This method gets called through r5, and expects 3 words after the call:

* The number of bits to sum (usually 16)
* The actual data word to add to the crc (i.e. one of the words read from the header)
* The previous value calculated for the crc, starting with 0 for the 1st word.

I created the following macro11 source file to be able to run the actual code for the crc check:

```
.title	CRC calc
.enable	ama
.enable	abs
	.asect

.=2000

	jsr	r5,simbcc
	.word	16.
	.word	120000
	.word	0
	mov	temp4,5$
	jsr	r5,simbcc
	.word	16.
	.word	0
5$:	.word	0
	halt

simbcc:	mov	(r5)+,temp2
	mov	(r5)+,temp3
	mov	(r5)+,temp4
1$:	clr	bccfbk
	mov	temp4,r0
	ror	temp3
	adc	r0
	bit	#1,r0
	beq	2$
	com	bccfbk
2$:	mov	xpoly,r0
	com	r0
	bic	r0,bccfbk
	clc
	ror	temp4
	mov	bccfbk,r0
	mov	temp4,r1
	mov	r1,r2
	bic	r1,r0
	bic	bccfbk,r2
	bis	r2,r0
	bic	xpoly,temp4
	bis	r0,temp4
	dec	temp2
	bne	1$
	mov	temp4,r0
	rts	r5

XPOLY:	.word	120001
TEMP2:	.word	0
TEMP3:	.word	0
TEMP4:	.word	0
BCCFBK:	.word	0
```
This should be a direct copy of the code from the fiche. There were some nice discoveries made along the way:

* The macro11 assembler I used (https://github.com/j-hoppe/MACRO11) really does not give a f about errors. It more or less accepts anything. I entered the text "My mother wears yellow socks" just in the middle of the code and no error occurred at all. Absolutely terrible.
* As I need code that I can load nicely I need it to assemble at an absolute address. For that we use the stanza ".=2000", i.e. set the pc to 2000(octal). This DOES give a very uninformative error (bad ORG). After a lot of reading I found out that you need to add ".asect" before the org statement to make the section absolute.
* The xxdp module contained ".enable abs" at the top. I had not noticed the dot before the enable. This led to all code being made PC relative. Which is not that bad, but the listing does NOT show the actual words generated but the target addresses with a single quote behind them. The Unibone did not mind that ', and loaded the words as the actual words. This led to wildly misbehaving code. Only after manually verifying everything that was deposited in memory it became apparent what horrors had occurred. Not Fun.

Anyway. The start of the program contains the actual crc calculation for the data we read from the sector: first word 0xa000 (120000 oct), second word zeroes.

We can run this program on the Unibone by first compiling it with macro11 and copying it to the Unibone:

```
macro11 -l crc.lst crc.mac
scp crc.lst root@ubex:10.03_app_demo/5_applications/cpu/
```
(ubex is the host name of my Unibone).

We then create a boot script like this:
```
#!/root/10.03_app_demo/4_deploy/demo

# Inputfile for demo to execute "Hello world"
# Uses emulated CPU and (physical or emulated) DL11
# Read in with command line option  "demo --cmdfile ..."

dc                      # "device with cpu" menu

m i                     # emulate missing memory
sd dl11

p p ttyS2               # use "UART2 connector, see FAQ

# p b 300               # reduced baudrate

en dl11                 # switch on emulated DL11

en cpu20                # switch on emulated 11/20 CPU
sd cpu20                # select

m ll crc.lst            # load test program

p

init
p pc 2000

.print Enter p s 1 to run the program
```

This loads the listing in memory, ready to be executed. Entering p s 1 will start the CPU, it will halt after the code finishes and show the crc in r0:

```
DC>>> R0 021000 R1 021000 R2 021000 R3 000000 R4 000000 R5 000000 R6 000000 R7 002034
10 021000 11 021000 12 000000 13 000000 14 000000 15 000000 16 000000 17 000000
BA 002032 IR 000000 PSW 000
``` 

i.e. the sum is 21000, or 0x2200. I validated it with a Java program that implemented the same algorithm. This is a lot different from the value received (0x33).

