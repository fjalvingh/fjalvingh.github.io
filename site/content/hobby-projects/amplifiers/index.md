# Amplifiers

Simple class AB current amplifier with common base, common emitters

![The circuit: an NPN and a PNP in a complementary pair, each conducting for half the input waveform into the load.](image-20211207-205540.png)

(But with 10uF capacitor @ input and 1000uF at output, Vcc is 10V.

![Input on yellow and output on blue at 1kHz. The flat step through each zero crossing on the blue trace is the crossover distortion.](image-20211207-204727.png)

The crossover distortion is clearly visible.

Now with two diodes to bias the transistors:

![The biased version: two 1N4148s between the bases hold them about 1.2V apart so both transistors idle just on.](image-20211207-212325.png)

![With the diodes in place the output follows the input cleanly through zero, at 3.77V peak to peak against 4.40V in.](image-20211207-210917.png)

Oscillation

With tip31/tip32 the bloody thing oscillates:

![Swapping in a TIP31 and TIP32 makes it oscillate: every zero crossing sets off a burst on all three traces.](image-20211213-212251.png)

Beautiful pictures :wink:

 But slightly unwanted :wink:

Zooming in:

![Zoomed to 50ns per division with the cursors on one burst: 44.7ns between peaks, which is 22.36MHz.](image-20211213-212200.png)

We see a pulse of 44.7ns, equaling to a 22.4MHz oscillation.
