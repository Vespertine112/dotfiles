# my dotfiles

## Setup Script

Run `unpack.sh` on a fresh Arch install to handle package installs, font setup, Oh-My-Zsh, and symlinking.

> **Note:** The unpack script does not yet handle the Hyprland symlink — do that manually (see below). The eww symlink and script permissions are handled automatically.

---

## Hyprland (Wayland compositor)

Targets **Hyprland v0.53.0+** with the new nested block syntax and hyprwire IPC.

### Required packages

All of these are installed automatically by `unpack.sh`.

```
hyprland
kitty                       # terminal
dolphin                     # file manager
wofi                        # app launcher
eww-git                     # status bar (builds from source via AUR)
qt6ct                       # Qt6 theming
polkit-kde-agent            # auth agent (/usr/lib/polkit-kde-authentication-agent-1)
kwallet                     # kwalletd6 for credential storage
xdg-desktop-portal-hyprland # screen sharing / portals
swaync                      # notification daemon + eww bell
wlogout                     # power menu (eww power button)
swayosd                     # volume/caps-lock OSD pop-ups
playerctl                   # media key control + MPRIS metadata for eww
blueman                     # bluetooth GUI (eww bluetooth click)
bluez                       # bluetooth stack
bluez-utils                 # bluetooth CLI tools
pavucontrol                 # audio mixer GUI (eww volume click)
nm-connection-editor        # network manager GUI (eww network click)
pipewire                    # audio server
wireplumber                 # pipewire session manager
socat                       # Hyprland IPC socket listener (eww scripts)
jq                          # JSON parsing in eww scripts
```

### Plugins (via hyprpm)

- **hyprsplit** — persistent 10-workspace layout per monitor

Install plugins after Hyprland is running:

```sh
hyprpm add https://github.com/shezdy/hyprsplit
hyprpm enable hyprsplit
```

Plugins reload automatically on login via `exec-once = hyprpm reload -n`.


### Keybindings

Modifier key: **Alt** (`MOD1`)

| Binding | Action |
|---|---|
| `Alt + Q` | Open terminal (kitty) |
| `Alt + C` | Close active window |
| `Alt + M` | Exit Hyprland |
| `Alt + E` | Open file manager (dolphin) |
| `Alt + V` | Toggle floating |
| `Alt + \`` | Open app launcher (wofi) |
| `Alt + P` | Toggle pseudotile |
| `Alt + J` | Toggle split direction |
| `Alt + S` | Toggle scratchpad |
| `Alt + Shift + S` | Move window to scratchpad |
| `Alt + Arrow` | Move focus |
| `Alt + Shift + Arrow` | Move window |
| `Alt + 1–0` | Switch to workspace 1–10 |
| `Alt + Shift + 1–0` | Move window to workspace 1–10 |
| `Alt + Scroll` | Cycle workspaces |
| `Alt + LMB drag` | Move window |
| `Alt + RMB drag` | Resize window |

### Notes

- Monitor config uses `highrr` (highest refresh rate available), auto resolution and position
- Qt apps use `qt6ct` — set theme there after install
- `KDE_FULL_SESSION=true` is set so KDE/Plasma apps (dolphin, kwallet) work correctly under Hyprland
- Wallpaper: set via your preferred tool (not managed here); `force_default_wallpaper = 0` disables the Hyprland default

---

## eww (status bar)

[eww](https://github.com/elkowar/eww) (Elkowar's Wacky Widgets) is a flexible widget system used here as the status bar. Unlike Waybar, eww drives all data from shell scripts, which enables features like native image rendering — used for album art display.

Config at `eww/eww.yuck` (layout + data), `eww/eww.scss` (styles), `eww/scripts/` (data scripts).

Symlink (handled by `unpack.sh`):
```sh
ln -sf ~/Extensible/dotfiles/eww/ ~/.config/eww
chmod +x ~/.config/eww/scripts/*.sh
```

Start manually (Hyprland launches both bars automatically via `exec-once`):
```sh
eww open bar-dp2   # bar on DP-2 (workspaces 1–10)
eww open bar-dp3   # bar on DP-3 (workspaces 11–20)
```

Kill: `pkill eww`

### Scripts

| Script | Purpose |
|---|---|
| `scripts/workspaces.sh [MONITOR]` | Hyprland workspace state (socat IPC listener) |
| `scripts/window.sh` | Active window title (socat IPC listener) |
| `scripts/mpris.sh` | MPRIS track/artist (playerctl -F) |
| `scripts/cpu.sh` | CPU usage % |
| `scripts/memory.sh` | RAM usage % |
| `scripts/network.sh` | WiFi/ethernet/disconnected state |
| `scripts/bluetooth.sh` | Bluetooth on/off/connected state |
| `scripts/volume.sh` | Volume level + mute (pactl subscriber) |
| `scripts/volume-scroll.sh [up\|down]` | Adjust volume via scroll |
| `scripts/notifications.sh` | swaync notification count + DND state |

### Album art (future)

eww's `(image :path "..." :image-width N)` widget can display album art natively. The groundwork is in place — add an `mpris-art` deflisten script that caches artwork from `playerctl metadata mpris:artUrl`, then drop an `(image)` into the `mpris-widget`.

---

## Alacritty

Theme: Catppuccin Mocha (`alacritty/catppuccin-mocha.toml`).

Symlink: `ln -sf ~/Extensible/dotfiles/alacritty/ ~/.config/alacritty`

---

## Shell (zsh)

- **Oh-My-Zsh** with `zsh-syntax-highlighting` and `zsh-autosuggestions`
- **Starship** prompt

Symlinks:
```sh
ln -sf ~/Extensible/dotfiles/zsh/.zshrc ~/
ln -sf ~/Extensible/dotfiles/starship/starship.toml ~/.config/
```

---

## Neovim

Requires **ripgrep** for Telescope file search to work.

Symlink: `ln -sf ~/Extensible/dotfiles/nvim/ ~/.config/nvim`

---

## Fonts

JetBrains Mono is bundled in `assets/JetBrainsMono.tar.xz`. The unpack script installs it to `/usr/share/fonts/myfonts/`.

Manual install:
```sh
tar -xvf ./assets/JetBrainsMono.tar.xz -C ./assets/
sudo mkdir -p /usr/share/fonts/myfonts
sudo mv ./assets/*.ttf /usr/share/fonts/myfonts/
fc-cache -fv
```

---

## Windows Notes

Install [komorebi](https://github.com/LGUG2Z/komorebi) as a tiling window manager.

Config: `komorebi.json`

Add to PowerShell profile (`~/Documents/WindowsPowerShell/profile.ps1`):
```powershell
Invoke-Expression (&starship init powershell)
```
