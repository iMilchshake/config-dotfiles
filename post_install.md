these are various steps i perform on a clean setup. I dont guarantee that they are correct / optimal, but they work for my i3-wm setup.

# set theme and prefer dark mode

0. Clone Nordic theme repo to `~/.themes/Nordic/` (https://github.com/EliverLara/Nordic)
1. Install xdg-desktop-portal-gtk
2. Install xsettingsd (and run xsettingsd& in i3 startup)
3. Create `.xsettingsd` file in `$HOME`:
```
Net/ThemeName "Nordic"
Net/IconThemeName "Adwaita"
```
_Now gtk2/3/4 applications should work_

4. Set prefer dark:
`gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'`
you can check if it was correctly set via:
check with `gsettings get org.gnome.desktop.interface color-scheme` -> 'prefer-dark' (OK!)
_Now applications should default to dark mode_

5. Setup Qt theme using kvantum
- Install kvantum AND(!!) kvantum-qt5
- Start kvantummanager, install nordic kvantum theme from .themes folder
- Also maybe edit the theme (disable transparent)
- Create `.xprofile` in `$HOME` (or define vars elsewhere)
```
export QT_STYLE_OVERRIDE=kvantum
export EDITOR=nvim
export VISUAL=nvim
```
_Now Qt5/6 applications should use nord theme_
_u can also define variables like EDITOR/VISUAL here_

testing:
- vlc (qt5), obs-studio (qt6)
- gtk-demo (gtk2), gtk3-demo and gtk4-demo
- rightclick menus of systray icons _mostly_ work (steam doesnt?)

TODO #1:
Nordic repo says to:
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"
-> when i run `get` i still get 
gsettings get org.gnome.desktop.interface gtk-theme
'Adwaita'
tobi@endeavour-eagle-v2 ~> gsettings get org.gnome.desktop.wm.preferences theme
'Adwaita'
-> so maybe i should also set this, but i'll keep it for now.

# setting keyboard layout (eu)
`sudo localectl --no-convert set-x11-keymap eu`

# setting flat mouse profile
create `/etc/X11/xorg.conf.d/50-mouse-acceleration.conf`
```
# use this only with libinput!
# if xinput list-props <your-id> returns any libinput prefixes, ur running libinput
# if ur not running libinput use :
# Section "InputClass"
#	Identifier "My Mouse"
#	MatchIsPointer "yes"
#	Option "AccelerationProfile" "-1"
#	Option "AccelerationScheme" "none"
#	Option "AccelSpeed" "-1"
# EndSection
Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection
```

# setting fish shell as default 
easy approach is to just run `exec fish` in `.bashrc`

