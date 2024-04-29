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
	obsidian
	variety
)

yay -S --noconfirm $(printf "%s " "${aur_packages[@]}")

# Install fonts
tar -xvf ./assets/JetBrainsMono.tar.xz -C ./assets/
sudo mkdir -p /usr/share/fonts/myfonts
sudo mv ./assets/*.ttf /usr/share/fonts/myfonts/
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

# Setup sddm
sudo cp -r ./sddm.conf.d/ /etc/

# Symlink the stuff
ln -sf ~/Extensible/dotfiles/zsh/.zshrc ~/
ln -sf ~/Extensible/dotfiles/alacritty/ ~/.config/
ln -sf ~/Extensible/dotfiles/btop/ ~/.config/
ln -sf ~/Extensible/dotfiles/starship/starship.toml ~/.config/
ln -sf ~/Extensible/dotfiles/lazygit/ ~/.config/
ln -sf ~/Extensible/dotfiles/nvim/ ~/.config
ln -sf ~/Extensible/dotfiles/compfy/ ~/.config/
ln -sf ~/Extensible/dotfiles/X11/.Xresources ~/

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




