# Sigrok and other logic analyzer decoders

## The Sigrok syncserial decoder

I needed this decoder to help with debugging a Dec RL02/RL11 pair. The disk drive communicates with the controller using a serial link with clock and data, and I needed to be able to decode things a bit faster than following the edges. The decoder is called syncserial, and is very simple. The zip file containing the decoder [can be download here](syncserial.zip). Unzip the zip in the "decoders" folder of Sigrok to make it active.

The source code for the decoder can [also be seen here](syncserial.py).

The decoder has only a few settings:

![syncserial options](options.png)

Their usage should be obvious. The decoder produces output like this:

![syncserial example output](output.png)

As I did not want to set things like bit rates the decoder assumes a few things. Firstly it will calculate the average bit length from the data, and it will assume that this length does not vary a lot. It uses this bit length to force an end to the last bit in a bit train: if no edge is coming within 4* the average bit length then it ends the last bit at that interval (this is why the last bit trails a lot). This also resets the code that collects the nibble data so that it is easier so see the actual data.

