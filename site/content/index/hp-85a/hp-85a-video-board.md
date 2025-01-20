# HP 85A Video board

The device had no video. Measuring the 800V tap showed only 85V present.

# Voltages

+6V is 6.028v, fine

+12v is 12.2v, fine

+28v is 23.4 volt

+32V is 26v

\-40v is -32v

800v is 85v

The +6v and 12v come from the PSU, these are fine. The others are generated through the T1 transformer, something is definitely off there.

# Vertical amplifier

tp2 showed:

![](./attachments/image-20220410-095152.png)

16.7ms should be 17ms, assuming it to be ok

![](./attachments/image-20220410-105946.png)

Voltages seem OK too.

TP3 (inverse of the above, more or less)

![](./attachments/image-20220410-132630.png)

TP1 should be a clean sawtooth but looks like this:

![](./attachments/image-20220410-132851.png)

# Horizontal

tp5 (5V square 64us):

![](./attachments/image-20220410-133323.png)

Q14 base:

![](./attachments/image-20220410-134555.png)

Must be between -0.5 and about 1.5V, 64us (dead on)

Q14 collector:

![](./attachments/image-20220410-134821.png)

Does not look right, it should be:

![](./attachments/image-20220410-141210.png)

Collector T13 (driving transistor for the flyback transformer):

![](./attachments/image-20220410-140144.png)

Looks very much off; should be:

![](./attachments/image-20220410-141248.png)

After some consultation on the [HPSeries80 newsgroup](https://groups.io/g/hpseries80) and after a long wait for a set of replacement parts from China and Mouser I could try to replace things to see what would work.

I started to check diodes and caps in the high voltage paths, mainly around the 800V output (and the things that generate that). All diodes checked fine.

After that I replaced some caps around the 800V path and the driver circuit for it. Most of them seemed fine (there were a few that were off) but just to make sure:

C52, 10uF tantalum

C46 200uF alu (replaced with 470uF)

C57 1uF 150V

C49 0.01 uF 800V

C48 .01 1KV

I then wriggled back the board in the computer in such a way that I could at least still work on it (for that I had to cut the tie wraps and move around the cables a bit), and checked if it had made a change. Sadly enough there was still no picture, and I started to smell something..

I then checked the board for possible overheating on the PCB. I could not really do that by using my fingers as that tends to be unwise when there are 800V and 8KV voltages around, so I used an IR camera and yes, something was really off:

![](./attachments/image-20220507-184748.png)

This was the R21 resistor heating up like mad. Sadly enough this was due to my own mistake: I had mistakenly taken the bar on the C52 capacitor as the minus - but the tiny little + sign had apparently rubbed off just under it, so it was voltage inverted 8-(. Replacing the cap in the right direction solved the heat issue- but still no picture, and all signals looked the same as before.

Next step was to check U13, the main driver transistor. It did check OK’ish with the little Chinese component tester:

![](./attachments/image-20220507-185631.png)

but the Hfe was only 2, and that looked wrong. I soldered in a replacement (BU406, as advised by Russel Bull on the hpseries80 list) and tested again… The signal on the emitter on Q14 now immediately looked much better (blue trace) although slightly higher than indicated on the schematic:

![](./attachments/image-20220507-185844.png)

and the “-48” test point now had the correct voltage of around 40V, and yes: I now have a picture:

![](./attachments/image-20220507-190222.png)

Next steps will be to clean up that picture :wink: