# Linux tips and tricks

Just a collection of things to know around Linux and its distributions.

## Moving to kde

As the Gnome idiots decided to drop x11 - way too soon - I will try to move to kde as they apparently will keep supporting x11 a while longer. KDE is not painless either, it is pretty surprising to find quite some issues there, especially around usability, but it is workable so far. Tips to handle the migration:

* Do not install just kubuntu-desktop in your Gnome based Ubuntu. For one reason or another KDE is a lot less table and has a lot of strange behavior when you do that. The largest showstopper was that you would quickly get into a state where the system would not react to the mouse at all: the mouse moved, but clicking things had no effect. The keyboard would work but nothing I did got the mouse working again, a reboot was needed.

### Missing functionality / bad usability

#### VPN and network switching

Install the "Network" applet in the Panel to be able to switch networks and to connect to VPNs. It is a shit UI because its main task should be to connect or switch, but to do that you need to click on a "connect" button that is 10x smaller than the area. The Gnome way of just having a button is so much better.. 

#### No proper ssh key management

Under Ubuntu Gnome working with ssh Just Works(tm). Keys under ~/.ssh are transparently added to the ssh agent when first used. Not so for Kubuntu... It does start ssh-agent but does not scan the keys.

The workaround is a bit shitty, but is as follows: create an autostart script (I put mine in .config/autostart/ssh) with the following content:

```
#!/bin/sh
SSH_ASKPASS=/usr/bin/ksshaskpass ssh-add $( find $HOME/.ssh -maxdepth 1 -type f -name '*.pub' -exec bash -c 'for arg; do echo "${arg%.*}"; done' bash {} \; ) </dev/null
```

Make sure that ksshaskpass is installed, ofc.

This script finds all files under .ssh with the ".pub" extension. It then removes that extension to find all private keys, which are then added to the ssh agent.

To make this autostart file work you also need to add it using the KDE System Settings tool in the Autostart section.


## Shit Wayland shit

This terrible piece of incomplete and unfinished software is being pushed to people by a load of idiots that apparently have the Microsoft mentality of "If it works for me fuck you". I will stay on X11 for as long as I can because just too many things do not work properly on this crap, but I fear that will be a losing game. So in here I will collect things to remember whenever something in Wayland does not work and I find a workaround.

### Flameshot

This is my favorite screenshot tool as it allows simple edits like arrows and obscuring area's just from the tool. I use it several times a day, and of course it does not work under Wayland. The usual error is "screenshot capture failed". A solution that worked for me was to execute these two commands on the command line:

```
dbus-send --session --print-reply=literal --dest=org.freedesktop.impl.portal.PermissionStore /org/freedesktop/impl/portal/PermissionStore org.freedesktop.impl.portal.PermissionStore.SetPermission string:'screenshot' boolean:true string:'screenshot' string:'org.flameshot.Flameshot' array:string:'yes'
dbus-send --session --print-reply=literal --dest=org.freedesktop.impl.portal.PermissionStore /org/freedesktop/impl/portal/PermissionStore org.freedesktop.impl.portal.PermissionStore.Lookup string:'screenshot' string:'screenshot'
```


