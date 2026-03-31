# Installing and testing the drive on the PDP11/44 w/Unibone

To test I need to run xxdp on the PDP11/44. This is done the easiest using the Unibone as I have no other working hardware at the moment. The Unibone emulates a set of RL02 drives by itself on the first RL11 controller. This means that we will have to set the controller we want to test to be the second controller in the system.

## Setting the controller as the second one

The first RL11 controller has the following settings:

* Base address 774400
* Vector address 160

The RL11 takes 10 (oct) bytes of I/O window (4 registers of 2 bytes each). The vector address increments by 4. So the second controller should be set to:

* Base address 774410
* Vector address 164

For this we need to change the dip switches. First the vector address which is encoded as follows:

![vector address encoding in switches](vector-sw.png)

This shows that we need to switch W2 to jumpers IN. These are not DIP switches but actually 0ohm resistors soldered to the board:

![jumper resistors for the vector address](vector-resistors.png)

The tech drawings show that the jumpers are from W6 at the top downwards to W1 at the bottom:

![Jumper numbers](jumper-nrs.png)

So we need a jumper on the 2nd thingy from the bottom. I decided to add a small switch for that so that we can easily revert without soldering on these fragile board too much:

![vector address switch W2](vector-switch-w2.png)

The CSR address needs to be set using the following schema:

![CSR address](csr-doc.png)

We will need to toggle W13 ON. I added the same switch there after removing the wire wrap posts from that location.

## Running the tests

### ZRLG

![zrlg-11](zrlgresult.png)

### ZRLH

This test fails:

![zrlh failure 1](zrlh-fail-01.png)

cs 112313 (94cb h):
- composite error (15)
- header not found (12, bit 10 is set)
- operation incomplete (10)
- controller ready (7)
- interrupt enable
- function code: 101 (write data)
- drive ready



### ZRLJ

![zrlj failure 1](zrlj-fail-01.png)

