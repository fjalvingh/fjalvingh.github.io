# HP 16702A Logic Analyzer

Bought from Ebay, in good state. It came with 2x HP 16556A analyzer cards, in 2021. I do not use it a lot but when I do it is a godsend, because it is immensely capable and has 136 inputs (2x 68).

## A nasty surprise

But when I needed it in 2026 I had a shitty surprise: one of the 16556A cards failed. I then found out that the analyzer cards in these machines have a terrible problem. The bottom of the card contains plastic strips (gliders) that are used to prevent scraping off SMD components from the underside of the card while inserting it. Those gliders are glued on the card, and the glue, after about 5 years, has started to eat the copper on the board... This means that traces that pass under or close to those gliders can be cut, and worse: if the crap enters a via it can destroy the via. As this is an 8-layer board this makes it very hard to repair that.. This is called the "green death" because that's the color of the corrosion.

I decided to buy two other boards (HP 16717A) which were marked as "in working order". Pretty pricy, coming from America, but I really want this machine to work.. Alas, when they did arrive they also did not work. I decided to keep them, though (and I got quite some money back from the Ebay vendor, which I thought was quite great), because around 2025/2026 there appeared on the Internet two separate schematics and reverse engineered boards. There is a CuriousMarc video that also repaired a 16717A, so that seemed... possible..

The repairs of those boards (and the resources used) can be found below.

* [The first 16717A](50-16717a-1/index.md)




I replaced its harddisk with an SCSI2SD card.

## Projects

- [Z80 pod](hp-16702a-z80-pod-project/index.md) build
- [GP-IB pod](hpib-probe/index.md)

Links with information:

- [Z80 pod assignments](https://www.eevblog.com/forum/testgear/older-logic-analyzer-question/25/)
- [68K CPU probe adapter](https://github.com/GeorgeRudolf/ersatz10311)
