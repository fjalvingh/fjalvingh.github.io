# Unibone disk image details

# How to get details

## XXDP images

To get the directory of xxdp images, use the tools from here: [https://github.com/AK6DN/xxdpdir](https://github.com/AK6DN/xxdpdir)

You can mount the Unibone disk image (the sd card image) on your PC as follows. Unzip the image using

```
gzip -d sdcard_unibone_2023_02_14.dd.gz
```

Then use fdisk to find the start of the file system image:

```
jal@chatelet:~/t$ fdisk -lu sdcard_unibone_2023_02_14.dd 
Disk sdcard_unibone_2023_02_14.dd: 19.6 GiB, 21040988160 bytes, 41095680 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xb72c8c81

Device                        Boot Start      End  Sectors  Size Id Type
sdcard_unibone_2023_02_14.dd1 *     8192 31115263 31107072 14.8G 83 Linux
```

This shows the partition start at 8192. Multiply by the sector size (512) to get the byte offset which is 4,194,304

Now mount the image as follows:

```
sudo mount -o loop,offset=4194304 /path/to/sdcard_unibone_2023_02_14.dd /media/$USER/test
```

(you might want to make that test directory before mounting).

With this image mounted you can get a directory of a XXDP disk image like this:

```
./xxdpdir.pl --image=/home/jal/test/10.03_app_demo/5_applications/xxdp.rl02/xxdp25.rl02 --directory
```

# xxdp25.rl02

- Used by cpu20\_xxdp\_rl0\* scripts
- Contains XXDP 2.4 small monitor and a set of tests
- The sorted list of tests can be downloaded here: [xxdp-xxdp25-rl02.txt](xxdp-xxdp25-rl02.txt)

# xxdp22.rl02

- Sorted list of tests: [xxdp-22.txt](xxdp-22.txt)
