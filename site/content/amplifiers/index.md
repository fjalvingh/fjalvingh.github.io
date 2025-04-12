# Amplifiers

Simple class AB current amplifier with common base, common emitters

![](image-20211207-205540.png)

(But with 10uF capacitor @ input and 1000uF at output, Vcc is 10V.

![](image-20211207-204727.png)

The crossover distortion is clearly visible.

Now with two diodes to bias the transistors:

![](image-20211207-212325.png)

![](image-20211207-210917.png)

Oscillation

With tip31/tip32 the bloody thing oscillates:

![](image-20211213-212251.png)

Beautiful pictures :wink:

 But slightly unwanted :wink:

Zooming in:

![](image-20211213-212200.png)

We see a pulse of 44.7ns, equaling to a 22.4MHz oscillation.
