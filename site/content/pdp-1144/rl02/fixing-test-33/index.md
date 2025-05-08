# Fixing test 33

The next round is to fix ZRLGE0 test 33. This reports:

![test result](test33-result.png)

The test expects to read sectors in sequence, but instead it appears that it often gets the sector AFTER the one it expects. I changed disk packs but the error stays the same so it is probably a real issue..



