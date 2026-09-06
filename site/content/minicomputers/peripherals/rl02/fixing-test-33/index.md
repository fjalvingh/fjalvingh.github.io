# Fixing test 33

The next round is to fix ZRLGE0 test 33. This reports:

![Test 33 failing over and over with a sector address out of sequence. Each time the sector received is exactly one higher than the one expected.](test33-result.png)

The test does the following:

* It loops 40 times. Every loop it sends a "read header" command, waits for the command to complete, and then reads 3 words from the MP register (the header data).
* Once all 40 are read it gets the sector # of the first sector read. It then checks that every sector following is one more than the first one. It of course wraps to sector 0 once sector 39 has been read.

In our failed test we often get a sector that is one more than the sector expected. I am wondering whether that could be because the CPU emulation of the Unibone is 10x slower than a real CPU.. To check I enabled "direct memory access" on the Unibone. This lets the Unibone, when running standalone, read and write memory directly, not over the Unibus. It will only use the Unibus for the I/O area. This speeds up the emulation a lot, to about half the speed of a real PDP-11.

With this the test works:

![With direct memory access enabled on the Unibone, ZRLG completes two passes with no errors at all.](zrlg-works.png)

The drive makes a bit of noise doing the seek tests so even those parts seem to be fine!

## Running ZRLH

The final test is ZRLH, this one runs without problems:

![ZRLH, which tests write data, read data and write check, runs three passes clean as well.](test-zrlh.png)


Wheehaw ;)
