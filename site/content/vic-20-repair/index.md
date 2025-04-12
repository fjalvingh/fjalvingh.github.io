# VIC 20 repair

Missing color on screen

Looking at the video signal (yellow), the luma output of the 6561 (pin2) and the chroma output (pin 3) we see:

![](image-20220212-154309.png)

The chroma signal is there but is completely missing from the output.

It turned out the previous owner had made a modification that went bad, disconnecting the capacitor that connected chroma to the luma signal. Adding the capacitor fixed it:

![](image-20220213-101041.png)

Capturing a line in the middle of the screen easily shows the blue border on the left and right sides:

![](image-20220213-101850.png)
