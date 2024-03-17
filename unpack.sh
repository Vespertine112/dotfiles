# Install nessecary AUR packs
yay -S brave-bin compfy neovim btop alacritty starship zsh npm xclip lazygit 

# Install fonts
tar -xvf ./assets/JetBrainsMono.tar.xz -C ./assets/
mkdir -p /usr/share/fonts/myfonts
mv ./assets/*.ttf /usr/share/fonts/myfonts/

# ======== ZSH ========
# Zsh-syntax-highlighting for plugin manager (Oh-My-Zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink the stuff
ln -s ~/Extensible/dotfiles/zsh/.zshrc ~/
ln -s ~/Extensible/dotfiles/alacritty/ ~/.config/
ln -s ~/Extensible/dotfiles/btop/ ~/.config/
ln -s ~/Extensible/dotfiles/starship/starship.toml ~/.config/

# Setup Zsh
chsh -s $(which zsh)

# ==== AWESOME INSTALLATION & CONFIG =====
yay -S awesome-git

yay -Sy rofi acpi acpid acpi_call upower lxappearance-gtk3 jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim mpv mpd mpc mpdris2 python-mutagen ncmpcpp playerctl --needed

systemctl --user enable mpd.service
systemctl --user start mpd.service

git submodule update --init --recursive

ln -s ./Boru/config/* ~/.config/ 

sudo cp -r ./Boru/misc/fonts/* /usr/share/fonts/myfonts/
fc-cache -fv




