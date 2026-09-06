# rl02: checking the controller's cmd signal

Time to take out the scope and logic analyzer. First check the drive inputs, which will be SYSCLK and DRIVE COMMAND (on the RL02):

![The drive's line receivers. The arrows mark DRIVE COMMAND on J12-X and SYS CLK on J12-M, both arriving at the E61 75107B receivers.](rl02-receive-1.png)

Putting the oscilloscope on pins 1, 2 and 4 of E61 shows no clock signal. I checked the RV11 and the cable and clock DID come out (check the HH and JJ pins on the connector, use the translation to IDC numbering [which you can find here](../../../pdp-common-info/decalphabet/index.md)). I cleaned the connectors on the drive side, after that clock did appear - but still the same error.

Next round is the logic analyzer. I added a Saleae thingy to both pin4 (SYSCLK) and pin9 (CMD) of E61 and got a nice clock- but no activity at all on the CMD line..

## Check some more basics

As we are with the LA let's check the sector pulses and drive ready.

![Drive ready and the sector pulses on the analyzer. The measured interval is 624.875us, inside the 625us +/- 6us the manual allows.](la-drvready-1.png)

The sector pulse seems ok, manual says 625us +/- 6us.


## Checking the rv11 for cmd data

Next round is to check the same on the RV11. The failing test is trying to send an incorrect GET STATUS command to the drive. This uses function code 2, and there is a good summary of how this works in the rv11 technical guide:

![Section 5.3 of the technical guide: during a get status the PC runs 0 through 13, CON 2:0 holds 7 to select GO as the increment condition, and steps 3 to 12 generate SEND STATUS.](tech-get-status.png)

We also need the schematics there:

![The controller end: P8 DRV CMD and P10 SYS CLK both leave through the E5 75113 line drivers.](rv11-clock.png)

Clock and CMD are both leaving from E5. Putting the LA there shows the same symptom: no CMD data.

Next round: logic analyzer, connected as follows:

![Where the command is built. The E109 74150 serializes the bits, the E40 74LS00 gates them with P7 SEND DR CMD H, and the 74S74 behind it clocks the result out as P8 DRV CMD.](rl11-cmd-gen-1.png)

* sysclk from E5 pin 11
* cmd from E5 pin 5
* cmdsrc from E109 pin 10 (the 74150 shift register)
* p13 on E40 (cmd in from inverted 74150)
* p12 on E40 (P7 send dr cmd H)

which shows:

![The first capture. cmdsrc and p13 both move, but p12 stays low throughout, so the E40 output never changes and nothing is sent.](la-cmd-signal-1.png)

While the 74150 sends output p12 stays low, and that causes the output of E40 to remain low too, and hence no data is sent. The signal p7 send dr cmd H comes from an xor gate (p6, E83). Adding pins 4 and 5 to the LA shows that both input stay low too. Both of these come from a set of PROMs:

* p4 = p6 send status H (E114 pin 15)
* p5 = p7 ena diff clk H (E112 pin 8)

Checking whether we see a function code on E114 is next (pins 2,4,5,6). For this we also need the clock for its addresses, which comes from E104, a 74161 counter, pin 2.

![The function code lines f0 to f2 at E114, with the E104 counter clock on the top trace. That counter clock shows nothing at all.](la-fcode-1.png)

This shows something odd imo: no clock on E104p2, the counter. This comes from a set of flipflops ultimately controlled by E102, a 74151 8-to-1 multiplexer. This has a number of inputs; the input that should control the "PC" (the 74161) gets selected by that thing. Next step: do we get pulses from it? I add LA connections to E102 pin6 (the output) and to pins 9..11, the input selector inputs. This produces:

![The E102 74151 added to the capture. The select inputs pick input 7, which is correct, but its output at e102p6 stays low the whole time.](la-74151-1.png)

which shows that the input selected seems to be #7 (which is correct according to the tech explanation) p5 go 1 (H) which apparently is low all the time (p6 of 74151 is the inverse of the input. It is low, checked). Next is to look at the source of this signal. It comes from page 5 E101, a 74S74:

![Page 5 of the drawings: the 74S74 that produces P5 GO, clocked from TS BUS 07 and cleared through the E11 74S32.](schema-p5-74s74.png)

Attaching the LA there shows activity:

![The flip-flop doing its job: D goes low, the clock dips and returns, q on p9 follows it low, and a microsecond later a low on p10 (PRE) sets q back to 1.](la-74s74-1.png)

We see that the flipflop seems to do its work: D gets low, shortly after CLK goes down and up, and p9 (q) gets low too. A us later comes a low on p10 (PRE) which sets the q output back to 1 again.

There appears to be an error in the schematic; E101 on the drawing has 2x pin 8 and 9 with inverted meaning. p8 is Q-bar, p9 is Q. E102 p12+p13 is connected to p8 (Q-bar).

Checking again the LA, now with E102 p6 (inverted output) and p12 (output from e101) shows that I messed up before:

![The same point captured again, now with e102p6 and e102p12. Pulses are leaving the multiplexer after all, and the counter clock at e104p2 is running.](la-e102-again.png)

We nicely see pulses leaving it. That SHOULD mean that our PC advances, and at least now I see pulses at e104p2 (CLK).

## Cluestick....

I fear that what went wrong is that I forgot to switch on the drive in some of the initial measurements and did not notice, and that sent me on a wild goose chase. Being stupid never helps, sigh.

## We have cmd output...

Well, we now do seem to have cmd output on e5p5. According to the test it sends the get status command with only the marker bit set (so a single bit). This single bit should be the width of a single clock period, as far as I understand, and that does not seem to be the case here: 

![Command output at last. The pulse on e5p5 lasts 3.875us, which against a 243.9ns clock period is about 16 clocks where one bit was expected.](la-cmd-active-1.png)

Perhaps that is why OPI is not being set? If the thing is sending a lot of ones then the drive will see it as the proper GS bit, and it will just work.... That pulse is 3.875uS long. With a clock of 4.1MHz (243.9ns) this is about 16 clocks.. 

Next trace is to see what happens around that 74150. One expects as input the 0001(hex) and as output the bit pattern. But it does not look like it:

![Around the 74150: the data inputs d0 to d3 change as they should, but the select lines s0 to s3 never move.](la-74150-2.png)

If we zoom in around the last CMD pulse we see:

![Zoomed in on the last command pulse. d0 to d3 hold a 1H as expected while s0 to s3 stay at zero throughout.](la-74150-3-zoomed.png)

d0..d3 show a 1H which is what I would expect. But nothing happens on the s0..s3 lines. That looks wrong too. These lines get controlled by E98, a 74161 counter. Let's monitor its CLK and CLR line to see what happens:

![The E98 74161: clear stays high and the clock is pulsing, yet the 74150 select lines never leave zero. The counter is dead.](la-e98-clockandclear.png)

Clear is high, clock is pulsing - but the 74150 s0..s3 lines stay at 0. **This looks like a failed 74161**.

I replaced the 74161 with a 74LS161 as I had nothing else, and I put it in a socket ofc:

![The socket fitted in place of the 74161, with the DM74150N it feeds at the left.](new-socket.png)

and with that we got:

![The diagnostic now runs past test 27 and stops in test 33 instead, on a sector address out of sequence during consecutive read headers.](test27-passed.png)

The signals also look a whole lot better now:

![The same lines after the swap: s0 to s3 now count through the 74150 inputs while e98p2 clocks.](la-74161-replaced.png)

