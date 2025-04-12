# Getting simh to run with an ethernet connection

> [!INFO]
> work in progress

Used the following as a run file:

```
set console log=./console.log
set cpu 11/44, 4M
set cpu idle
set rq0 rd54
#attach rq0 rsx11mplus_4_6_bl87.dsk
attach rq0 rsx11mpbl_mxf.dsk
set rq1 rd54
attach rq1 -i rsx11-1.dsk
set rq2 rd54
attach rq2 -i rsx11-2.dsk
set dz lines=16
attach dz 10001
set clk 50

# ethernet attempt
set xu enable
set xu mac=aa:00:04:00:1e:78
attach xu enp69s0
#attach xu nat:tcp=21:10.0.2.15:21,tcp=23:10.0.2.15:23
show xu
```

Running this verbatim reports:

```
/home/jal/hobby/simh/rsx11mplus/run.ini-18> attach xu enp69s0
%SIM-ERROR: Eth: pcap_open_live error - enp69s0: You don't have permission to perform this capture on that device (socket: Operation not permitted)
%SIM-ERROR: Eth: open error - enp69s0: You don't have permission to perform this capture on that device (socket: Operation not permitted)
```

To solve this I did the following:

```
sudo setcap cap_net_raw,cap_net_admin=eip ~/bin/pdp11
```

After that the attach works:

```
/home/jal/hobby/simh/rsx11mplus/run.ini-18> attach xu enp69s0
%SIM-INFO: Eth: opened OS device enp69s0
XU      address=17774510-17774517, vector=120, BR5, MAC=AA:00:04:00:1E:78
        type=DELUA, throttle=disabled
        attached to enp69s0
```
