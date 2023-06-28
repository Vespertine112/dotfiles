# dotfiles
dot-files configrepo (endeavour os / general) 

# Starship terminal
[Linux] ln to ~/.config then add to .zshrc
-> eval "$(starship init zsh)" 
-> Install all plugins through oh-my-zsh
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
-> Then remove the theme enable block from the oh-my-zsh.sh script

[Windows] Add to powershell profile in ~/Documents/WindowsPowershell/profile.ps1
-> Invoke-Expression (&starship init powershell)

# General Tooling
-> Rofi for launcher / powermenu / volume
-> Polybar for polybar
-> picom for compositor using jonaburg animations with tweaks
-> Custom starship for shell prompt
-> zsh for shell

# Notes
-> use xrandr for refresh rates 
-> If using polybar themes, you need to install mpd
-> Need ttf-icomoon-feather for polybar!

# TODO:
-> Implement polybar weather and better themeing
-> Need to yoink the material theme and rewrite it to resolve mpd issues 