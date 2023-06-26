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

# TODO:
-> Implement polybar weather and better themeing