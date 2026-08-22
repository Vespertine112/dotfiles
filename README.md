# my dotfiles

## Setup Script

Run `unpack.sh` on a fresh Arch install to handle package installs, font setup, Oh-My-Zsh, and symlinking.

> **Note:** The unpack script does not yet handle Hyprland or Waybar symlinks — do those manually (see below).

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
waybar                      # status bar
qt6ct                       # Qt6 theming
polkit-kde-agent            # auth agent (/usr/lib/polkit-kde-authentication-agent-1)
kwallet                     # kwalletd6 for credential storage
xdg-desktop-portal-hyprland # screen sharing / portals
swaync                      # notification daemon + waybar bell
wlogout                     # power menu (waybar power button)
swayosd                     # volume/caps-lock OSD pop-ups
playerctl                   # media key control (play/pause/next/prev)
blueman                     # bluetooth GUI (waybar bluetooth click)
bluez                       # bluetooth stack
bluez-utils                 # bluetooth CLI tools
pavucontrol                 # audio mixer GUI (waybar volume click)
nm-connection-editor        # network manager GUI (waybar network click)
pipewire                    # audio server
wireplumber                 # pipewire session manager
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

## Waybar

Config at `waybar/config.jsonc`, styles at `waybar/style.css`.

Symlink: `ln -sf ~/Extensible/dotfiles/waybar/ ~/.config/waybar`

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
