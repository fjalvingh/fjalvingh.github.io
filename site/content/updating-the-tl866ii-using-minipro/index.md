# Updating the TL866/II using Minipro

Get the firmware (a rar file) from here: [https://github.com/Kreeblah/XGecu\_Software](https://github.com/Kreeblah/XGecu_Software) . Use the Xgpro directory and look for the newest version there.

After download unrar the rar file. This will create a few files, one of those will be an executable.

Unrar the executable too. That will create many more files, and one of them will be called updateII.dat. This is the firmware file.

Now enter the following to update:

```
./minipro -F ~/t/updateII.dat
```

and it will update:

```
Found TL866II+ 04.2.128 (0x280)
Warning: Firmware is out of date.
  Expected  04.2.132 (0x284)
  Found     04.2.128 (0x280)
Device code: 02109838
Serial code: 6K0MT3XTNQIR5AHMX1HV
/home/jal/t/updateII.dat contains firmware version 04.2.132 (newer)

Do you want to continue with firmware update? y/n:y
Switching to bootloader... OK
Erasing... OK
Reflashing... 100%
Resetting device... OK
Reflash... OK
```
