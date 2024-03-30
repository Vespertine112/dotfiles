# Setup Git Defaults
  git config --global user.email "hillbgh@gmail.com"
  git config --global user.name "Vespertine"

# Install nessecary AUR packs
aur_packages=(
    brave-bin
    compfy
    neovim
    btop
    alacritty
    starship
    zsh
    npm
    xclip
    lazygit
	flameshot
	tmux
	nemo
	downgrade
	discord
	git-delta
	nemo
	# Optional
	obsidian
	variety
)

yay -S --noconfirm $(printf "%s " "${aur_packages[@]}")

# Install fonts
tar -xvf ./assets/JetBrainsMono.tar.xz -C ./assets/
mkdir -p /usr/share/fonts/myfonts
mv ./assets/*.ttf /usr/share/fonts/myfonts/
rm ./assets/*.ttf ./assets/*.txt ./assets/*.md

# ======== ZSH ========
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup Zsh
chsh -s $(which zsh)

# Zsh-syntax-highlighting for plugin manager (Oh-My-Zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Symlink the stuff
ln -s ~/Extensible/dotfiles/zsh/.zshrc ~/
ln -s ~/Extensible/dotfiles/alacritty/ ~/.config/
ln -s ~/Extensible/dotfiles/btop/ ~/.config/
ln -s ~/Extensible/dotfiles/starship/starship.toml ~/.config/
ln -s ~/Extensible/dotfiles/lazygit/ ~/.config/
ln -s ~/Extensible/dotfiles/nvim/ ~/.config
ln -s ~/Extensible/dotfiles/compfy/ ~/.config/
ln -s ~/Extensible/dotfiles/X11/.Xresources ~/

# ==== AWESOME INSTALLATION & CONFIG =====
awesome_config_packages=(
    awesome-git
    rofi
    acpi
    acpid
    acpi_call
    upower
    lxappearance-gtk3
    jq
    inotify-tools
    polkit-gnome
    xdotool
    xclip
    gpick
    ffmpeg
    blueman
    redshift
    pipewire
    pipewire-alsa
    pipewire-pulse
    alsa-utils
    brightnessctl
    feh
    maim
    mpv
    mpd
    mpc
    mpdris2
    python-mutagen
    ncmpcpp
    playerctl
)

yay -S --noconfirm $(printf "%s " "${awesome_config_packages[@]}")

systemctl --user enable mpd.service
systemctl --user start mpd.service

git submodule update --init --recursive

# Copies awesomewm & other configs 
ln -sf ~/Extensible/dotfiles/Boru/config/* ~/.config/ 

sudo cp -r ./Boru/misc/fonts/* /usr/share/fonts/myfonts/
fc-cache -fv




