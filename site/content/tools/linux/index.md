# Linux tips and tricks

Just a collection of things to know around Linux and its distributions.


## Wayland

This terrible piece of incomplete and non working software is being pushed to people y a load of idiots that apparently have the Microsoft mentality of "If it works for me fuck you". I will stay on X11 for as long as I can because just too many things do not work properly on this crap, but I fear that will be a losing game. So in here I will collect things to remember whenever something in Wayland does not work and I find a workaround.

### Flameshot

This is my favorite screenshot tool as it allows simple edits like arrows and obscuring area's just from the tool. I use it several times a day, and of course it does not work under Wayland. The usual error is "screenshot capture failed". A solution that worked for me was to execute these two commands on the command line:

```
dbus-send --session --print-reply=literal --dest=org.freedesktop.impl.portal.PermissionStore /org/freedesktop/impl/portal/PermissionStore org.freedesktop.impl.portal.PermissionStore.SetPermission string:'screenshot' boolean:true string:'screenshot' string:'org.flameshot.Flameshot' array:string:'yes'
dbus-send --session --print-reply=literal --dest=org.freedesktop.impl.portal.PermissionStore /org/freedesktop/impl/portal/PermissionStore org.freedesktop.impl.portal.PermissionStore.Lookup string:'screenshot' string:'screenshot'
```


