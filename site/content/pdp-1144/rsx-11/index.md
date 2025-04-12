# RSX-11

Links:

- This is a multipart series which does a sysgen, then installs decnet, basic, and some other lanuages:
-   [https://pdp2011.sytse.net/wordpress/pdp-11/sessions/rsx-11m-plus/](https://pdp2011.sytse.net/wordpress/pdp-11/sessions/rsx-11m-plus/)
-   The first page describes copying the OS disk from a DQ RD54 to an RP06 disk pack, but that step does not work. Don’t care; the sysgen works fine on the source pack.
- Version includes installation from scratch, including sysgen
-   [https://ancientbits.blogspot.com/2012/07/installing-rsx-11m-46-from-scratch-part.html](https://ancientbits.blogspot.com/2012/07/installing-rsx-11m-46-from-scratch-part.html)
-   [https://ancientbits.blogspot.com/2012/07/installing-rsx-11m-46-from-scratch-part\_12.html](https://ancientbits.blogspot.com/2012/07/installing-rsx-11m-46-from-scratch-part_12.html)
-   [https://ancientbits.blogspot.com/2012/07/installing-rsx-11m-46-from-scratch-part\_15.html](https://ancientbits.blogspot.com/2012/07/installing-rsx-11m-46-from-scratch-part_15.html)
- Another alternative is on retrocmp:
-   [https://retrocmp.com/stories/getting-rsx11m-running-on-simh](https://retrocmp.com/stories/getting-rsx11m-running-on-simh)

SIMH:

- Install from Github, as the Ubuntu version lags a lot
- [http://simh.trailing-edge.com/pdf/pdp11\_doc.pdf](http://simh.trailing-edge.com/pdf/pdp11_doc.pdf)

# RSX-11 tips and tricks

## Formatting (initializing) a disk using rsx-11 on simh

When adding a disk image to simh using “attach” simh will create the file if it does not yet exist- but it will be a file containing all zeroes - not a file system. This means it cannot be used by rsx-11 directly; it needs to be formatted.

Assume the following as simh setup:

```
set rq1 rd54
attach rq1 -i rsx11-1.dsk
```

When starting simh will create that file if it does not exist. After that we need to start rsx-11:

```
sim> boot rq0



RSX-11M-PLUS V4.6  BL87   1920.KW  System:"RSXMPL"
>RED DU:=SY:
>RED DU:=LB:
>RED DU:=SP:
>MOU DU0:"RSX11MPBL87"
>@DU:[1,2]STARTUP
>; 			PLEASE NOTE
>;
>;	If you have not yet read the system release notes, please do so
>;	now before attempting to perform a SYSGEN or to utilize the new
>;	features of this system.
>;
>;
>* Please enter time and date (HH:MM DD-MMM-YYYY) [S]: 16:15 16-may-2024
>TIME 16:15 16-may-2024
>ACS SY:/BLKS=1024.
>CON ONLINE ALL
>ELI /LOG/LIM
>CLI /INIT=DCL/CTRLC/DPR="<15><12>/$ /"
>INS LB:[1,1]RMSRESAB.TSK/RON=YES/PAR=GEN
>INS LB:[1,1]RMSLBL.TSK/RON=YES/PAR=GEN
>INS LB:[1,1]RMSLBM.TSK/RON=YES/PAR=GEN
>INS $QMGCLI
>INS $QMGCLI/TASK=...PRI
>INS $QMGCLI/TASK=...SUB
>QUE /START:QMG
>INS $QMGPRT/TASK=PRT.../SLV=NO
>QUE LP0:/CR/NM
>START/ACCOUNTING
>CON ESTAT LP0:
>QUE BAP0:/BATCH
>QUE BAP0:/AS:BATCH
>@ <EOF>
>
```

The device we want to initialize is rq1, which becomes du1 in rsx-11. We can see it using an rsx command:

```
>show dev du
DU0:	 Public Mounted Loaded Label=RSX11MPBL87 Type=RD54  
DU1:	 Loaded Type=RD54  
DU2:	 Loaded Type=RD54  
DU3:	 Loaded Type=RX50  
```

First allocate the du1 device so that it becomes our “private” device, i.e. usable for our terminal only, then mount it, and finally initialize it:

```
>allocate du1:
>mount du1:/foreign
>ini du1:/mxf=8000.
Searching for bad block descriptor file
INI -- Failed to read bad block file
```

This uses the dcl INITIALIZE VOLUME command, see the rsx reference for details.

Next, unmount and remount

```
>dmo du1:
16:22:02  *** DU1:  -- Dismount complete
DMO -- TT0:    dismounted from DU1:    *** Final dismount initiated ***
>mount du1:
>show dev du
DU0:	 Public Mounted Loaded Label=RSX11MPBL87 Type=RD54  
DU1:	 TT0: - Private Mounted Loaded Label= Type=RD54  
DU2:	 Loaded Type=RD54  
DU3:	 Loaded Type=RX50  
```

We can now show the root directory for the new device:

```
>dir du1:[0,0]

Directory DU1:[0,0]
16-MAY-24 16:22

INDEXF.SYS;1        4009.      16-MAY-24 16:20
BITMAP.SYS;1        77.        16-MAY-24 16:20
BADBLK.SYS;1        0.         16-MAY-24 16:20
000000.DIR;1        1.      C  16-MAY-24 16:20
CORIMG.SYS;1        0.         16-MAY-24 16:20

Total of 4087./4087. blocks in 5. files
```

## Mounting the TCP/IP disk image

The RSX-11 TCP/IP stack can be found here: [http://mim.stupi.net/tcpip.htm](http://mim.stupi.net/tcpip.htm) . You can download an rl02 disk image that should then be mounted in the simulator/machine.

To mount, first add the following lines to the simh config file (or type them in on the simh command prompt):

```
# tcp/ip rl02 installation image
set rl enabled
set rl0 rl02
attach rl0 bqtcp.dsk
```

Make sure your sysgen has support for rl02 drives, if not redo it.

Now start rsx-11, then do the following after finishing startup:

```
>bye
Have a Good Evening
12-AUG-90 22:17   TT0:  logged off DE0N   
>
>hello [1,1]/system

RSX-11M-PLUS V4.6   BL87    [1,54] System    DE0N   
12-AUG-90 22:17    Logged on Terminal TT0:  as SYS1

Good Evening
> mou dl0: /ovr # this overrides the missing volume label
>dir dl0:[0,0]
Directory DL0:[0,0]
12-AUG-90 22:25

INDEXF.SYS;1        637.       05-JUL-24 01:11
BITMAP.SYS;1        6.         05-JUL-24 01:11
BADBLK.SYS;1        20.        05-JUL-24 01:11
000000.DIR;1        2.      C  05-JUL-24 01:11
CORIMG.SYS;1        0.         05-JUL-24 01:11
LIB.DIR;1           1.      C  05-JUL-24 01:11
IP.DIR;1            3.      C  05-JUL-24 01:11
IPAPPL.DIR;1        1.      C  05-JUL-24 01:11
TELNETD.DIR;1       1.      C  05-JUL-24 01:11
IPHLP.DIR;1         1.      C  05-JUL-24 01:11
FTP.DIR;1           1.      C  05-JUL-24 01:11
FTPD.DIR;1          1.      C  05-JUL-24 01:11
MAILD.DIR;1         2.      C  05-JUL-24 01:11
IPBP2.DIR;1         1.      C  05-JUL-24 01:11
IPC.DIR;1           2.      C  05-JUL-24 01:11
IPF77.DIR;1         1.      C  05-JUL-24 01:11
IPPAS.DIR;1         1.      C  05-JUL-24 01:11
IPLISP.DIR;1        1.      C  05-JUL-24 01:11
DHCP.DIR;1          1.      C  05-JUL-24 01:11
RWHOD.DIR;1         1.      C  05-JUL-24 01:11
HTTP.DIR;1          1.      C  05-JUL-24 01:11
HTTPD.DIR;1         1.      C  05-JUL-24 01:11
CGIDEMO.DIR;1       1.      C  05-JUL-24 01:11
INETD.DIR;1         1.      C  05-JUL-24 01:11
IRCBOT.DIR;1        1.      C  05-JUL-24 01:11
IRC.DIR;1           1.      C  05-JUL-24 01:11
LPT.DIR;1           1.      C  05-JUL-24 01:11
IPRMD.DIR;1         1.      C  05-JUL-24 01:11
NTP.DIR;1           1.      C  05-JUL-24 01:11
IPNET.DIR;1         1.      C  05-JUL-24 01:11
MKE.DIR;1           1.      C  05-JUL-24 01:11
IPEXAMPLE.DIR;1     2.      C  05-JUL-24 01:11
PATCHES.DIR;1       1.      C  05-JUL-24 01:11
```

To actually install TCP/IP we need to copy the disk to du0:

```
> dmo dl0:
> mou/for dl0:
> bru /bac:tcpip/noini/ufd/new dl0: du:
```

I should set the UIC to default, but that does not work:

```
>set /uic=dl0:[ip]
SET -- Device not terminal 
```

So instead we start directly:

```
>@sy:[ip]ipgen
```

This runs a script. Answer the questions, and after that shutdown and restart.

To make tcp/ip run after the restart:

```
>@du:[ip]ipins.cmd
```

and after that

```
@du:[ip]ipappl
```

Output for these:

```
>@du:[ip]ipappl
>@ <EOF>
>
>ifconfig show pool
IPPOOL does not exist!
>@du:[ip]ipins.cmd
>loa if:/vec/high
>loa ip:/vec/high
>loa ud:/vec/high
>loa tc:/vec/high
LOA -- Warning - loadable driver larger than 4K
>con onl if0:
>con onl if1:
>con onl ip:
>con onl ud:
>con onl tc:
>ins LB:[IP]resacp
>ins LB:[IP]spoof
>dfl "dino"=HOSTNAME/GBL
>dfl "etc.to"=DNS$DOMAIN/GBL
>dfl LB:[1,2]HOSTS.TXT=HOSTS/GBL
>dfl "LOGICAL,DNS,FILE"=RESOLV$ORDER/GBL
>dfl "LOGICAL,FILE"=RESOLV$ORDER
>ifc create 256
>ifc start
Starting IP.
Starting UD.
Starting TC.
>ifc set IF0: add 192.168.1.234 mask 255.255.255.0
>ifc set IF0: sta ope
>ifc set IF1: add 127.0.0.1 mask 255.0.0.0
>ifc set IF1: sta ope
>ifc add rou 0.0.0.0 gat 192.168.1.1
RESACP - Starting resolver X0.17.

>run spoof 1t
>dfl =RESOLV$ORDER
SPOOF detector V1.5 active.
>@ <EOF>
>@du:[ip]ipappl
>DFL "LB:[IPLOG]"=IP$LOG/GBL
>DFL "LB:[HTTP]"=SYS$HTTP/GBL
>DFL "LB:[HTTPD]"=HTTPD$ROOT/GBL
>DFL "Welcome to DINO, rsx-11m-plus on pdp11/44"=TELNET$WELCOME/GR=5
>INS LB:[1,1]CCSMRX/PAR=GEN/RON=YES/PRO=[RE,RE,RE,RE]
>INS LB:[1,1]BP2SML/PAR=GEN/RON=YES/PRO=[RE,RE,RE,RE]
>INS LB:[IP]TELCOM/UIC=[1,54]/PRO=[RW,RW,,]
>INS LB:[IP]WWWRES
>INS LB:[IP]FTPD
RESACP - Resolver exiting...

>REM RESACP
>INS LB:[IP]RESACPFSL
>INS LB:[IP]RWHOD
>INS LB:[IP]NTPDATRES
>INS LB:[IP]TELNETD
>INS LB:[IP]INETD
>RUN TELNET 1T
>RUN NTPD 1T/RSI=24H
>RUN RWHOD 1T
>IFC ADD TCP PORT 7 SER IND$$$ MAX 2
>IFC ADD TCP PORT 9 SER IND$$$ MAX 2
>IFC ADD TCP PORT 13 SER IND$$$ MAX 2
>IFC ADD TCP PORT 17 SER IND$$$ MAX 2
>IFC ADD TCP PORT 21 SER FTP$$$ MAX 5
>IFC ADD TCP PORT 80 SER WWW$$$ MAX 5
>IFC ADD TCP PORT 113 SER IND$$$ MAX 10
>dfl lb:[maild]=maild$/gbl
TELNETD - Creating TN device with 8 units.
TELNETD V1.23 - server started.
NTPDATE - No host to connect to...

>pip maild$:mailnote.dat;/de/nm
>ins maild$:maild/task=mai$$$
>ins maild$:maild/task=maild/pri=20.
>ins maild$:maild/task=mailn0/pri=20.
>ins maild$:maild/task=mailn1/pri=20.
>ins maild$:maild/task=mai...
>ins maild$:maild/task=...mqm/slv=no
>ins maild$:mailrd/task=...mai
>ins maild$:mailrd/task=...sen
>ins maild$:mailrd/task=...new
>run maild/rsi=30m
>ifc add tcp port 25 ser mai$$$ max 5
>ncp set obj 27 nam mai$$$ cop 5 user default veri off
>ins maild$:mailman
>INS LB:[IP]NETSTAT
>INS LB:[IP]PING
>INS LB:[IP]TRACERT
>INS LB:[IP]DNS
>INS LB:[IP]TELNET
>INS LB:[IP]FTP
>INS LB:[IP]RUPTIME
>INS LB:[IP]RWHO
>@ <EOF>
>
 RESACP - Starting resolver X0.17.

>
```

Once this is done we can see ip configuration:

```
> ins du:[ip]ifconfig
>ifconfig show pool
POOL info.
Version: 9
Total:   256K
In use:  11.1K (4.3%)
Max use: 11.1K (4.3%)
Alloc f: 0
>ifconfig show all
MAILD: Failed to open log file

Intf   State Address                        Broadcast       MTU   ACP    Line
IF0:   *Run  192.168.1.234/24               192.168.1.255   8128         
IF1:   *Run  127.0.0.1/8                    127.255.255.255 8128     
```
