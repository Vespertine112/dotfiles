# Setup Git Defaults
  git config --global user.email "hillbgh@gmail.com"
  git config --global user.name "Vespertine"

# Install nessecary AUR packs
aur_packages=(
	brave-bin
	neovim
	btop
	alacritty
	starship
	zsh
	npm
	pnpm
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

	pipewire
	wireplumber

	# Hyprland
	hyprland
	kitty
	dolphin
	wofi
	waybar
	qt6ct
	polkit-kde-agent
	kwallet
	xdg-desktop-portal-hyprland

	# Waybar / desktop services
	swaync
	wlogout
	blueman
	bluez
	bluez-utils
	pavucontrol
	nm-connection-editor

	# Media / Audio OSD
	swayosd
	playerctl
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
ln -sf ~/Extensible/dotfiles/nvim/ ~/.config/
ln -sf ~/Extensible/dotfiles/hypr/ ~/.config/hypr
ln -sf ~/Extensible/dotfiles/waybar/ ~/.config/waybar

