# Data I/O 29B

After years of searching I found a seller, from an inheritance. I bought the following:

- Data I/O 29B programmer
- UniPak 2B

and got a LogicPak for “free” with it, albeit without any plugin modules.

The machine as it arrived:

![The 29B as it arrived, with the hex keypad, the red START button and the socket bay standing empty.](image-20230915-172357.png)

![The UniPak 2B: seven ZIF sockets with an indicator under each, and the wide master socket in the middle.](image-20230915-172440.png)

![The LogicPak, which came free with it. Nothing plugs into that 96-way connector without the module that belongs in it.](image-20230915-172511.png)

After connecting the UniPak and switching on I’m greeted with:

![The display at power up: SYSTEM 29B V06, the last software revision made for the machine.](image-20230915-172601.png)

V6 is the last version of the software for the 29B. Entering SELECT B2 START I got:

![SELECT B2 START reports CAGE 64K 29B V6, so this one has the 64K memory rather than the 1MB option.](image-20230915-172707.png)

So, not the 1MB version but 64K; I might want to extend that later.

The UniPak version can be found with SELECT EF START:

![SELECT EF START gives the UniPak revision, E06D VER 25.0, against a maximum of 27.](image-20230915-172810.png)

The max version is 27, so this is pretty good.
