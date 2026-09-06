# 9825A Arrival

## Arrival

My HP 9825A arrived from France :wink:

 Whether it works or not is unknown. It arrived in good but dusty state, but the tape drive is missing sadly enough.

The markings say it is a 9825A which is most probably correct; it has the System ROM cartridge that should no longer exist on the B.

Device pictures:

![The 9825A as it arrived, dusty but complete apart from the tape drive. Tape holds the printer cover on.](image-20220514-090753.png)

![The rear, with the four I/O slots empty and their covers still in place.](image-20220514-090805.png)

![The front: the single-line LED display, the thermal printer at the right, and the tape slot at the left with nothing behind it.](image-20220514-090814.png)

Opening up showed the following:

![Opened up. The RAM board sits across the top with the supply and its fan at the right; the cassette board is under the ribbon in the middle.](image-20220514-090914.png)

The keyboard and printer assembly:

![The keyboard and printer assembly lifted out, with the printer mechanism at the top left and the driver transistors along the top edge.](image-20220514-090952.png)

The device has clearly been opened before and was left in a non operable state: screws were missing, the cables to the cassette were left dangerously loose, and the keyboard assembly was not connected.

## Board overview

The topmost board is the RAM board. The slot above it is free and empty. The board has number 09825-66523 rev B, supposedly a 16KB RAM card:

![The RAM board, 09825-66523 rev B: thirty TMS4060 dynamic RAMs and a row of drivers and multiplexers down the left.](ram.jpg)

After removal of the RAM board, by moving it to a 90% angle and then sliding it out of its hinges by moving it sideways, we see the cassette board:

![The cassette board in place once the RAM board is out, hinged so it lifts away sideways.](image-20220522-090451.png)

A detailed picture of it after removal:

![The cassette board out, 09825-66561 rev C, with the two 1820-0742 controllers at the right and the drive transistors on their heatsink.](cassette.jpg)
