# Full desktop bundle: mango, waybar, swaync, rofi, fastfetch, wallpaper picker

All black and white with one lavender accent in mango and waybar.

## What goes where
- mango/        -> ~/.config/mango/      (8 files, config.conf sources the rest)
- waybar/       -> ~/.config/waybar/     (black island bar)
- swaync/       -> ~/.config/swaync/     (notification center, black and white)
- rofi/         -> ~/.config/rofi/       (launcher, black and white)
- fastfetch/    -> ~/.config/fastfetch/  (Fedora logo, black and white)
- local-bin/    -> ~/.local/bin/         (wallpaper-pick, rofi thumbnail grid)

## Before you install
Back up your existing ~/.config/mango, waybar, swaync, rofi and fastfetch folders. The rofi config replaces the old S0LYER theme, and the swaync config replaces the old one with its icon set.

## Edit before installing (replace USERNAME)
1. mango/autostart.conf: the wallpaper-pick line.
2. mango/binds.conf: the two wallpaper-pick binds.
3. fastfetch/config.jsonc: the logo "source" path.

## Install
  mkdir -p ~/.config ~/.local/bin
  cp -r mango waybar swaync rofi fastfetch ~/.config/
  cp local-bin/wallpaper-pick ~/.local/bin/
  chmod +x ~/.local/bin/wallpaper-pick

Put wallpapers in ~/Pictures/wallpapers, or set WALLPAPER_DIR to another folder.

Log out and back in to start mango. autostart.conf starts swaync, waybar and the last wallpaper (or a random one on first run).

## Keys (Mod = Super)
- Mod+Space or Mod+D: app launcher (rofi)
- Mod+Enter: foot terminal
- Mod+B: Firefox
- Mod+E: Dolphin
- Mod+W: wallpaper grid. Mod+Shift+W: random wallpaper
- Mod+N or Mod+Shift+Space: switch layout
- Mod+Q: close window. Mod+Shift+E: quit mango
- Mod+R: reload mango config

## Check
  mango -p ~/.config/mango/config.conf
  fastfetch
  swaync-client -R && swaync-client -rs   (reload swaync after editing)

## Packages
mangowm, waybar, swaync, rofi, fastfetch, foot, firefox, dolphin, wlogout, swaylock, swaybg, blueman, pavucontrol, playerctl, brightnessctl, wireplumber (wpctl), ImageMagick (wallpaper thumbnails), libnotify (notify-send, optional), JetBrains Mono Nerd Font (icons).

## Not tested on a real system
- exec_once with an underscore: the mango docs show exec-once. If waybar does not start, change exec_once to exec-once in autostart.conf.
- The swaync button "mmsg dispatch quit" depends on your mango version.
- fastfetch module names and logo rendering.
- Waybar's mango/workspaces module must exist in your Waybar build.
- The wallpaper grid look and speed.
