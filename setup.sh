#!/usr/bin/env sh

cd ~
sudo pacman -Syu
sudo pacman -S --needed base-devel helix git fzf ripgrep btop jq fish zed wezterm yazi zoxide chafa fd p7zip ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-jetbrains-mono-nerd

echo "YAY Setup in progress..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "YAY Setup completed"

cd ~
echo "AUR package installation in progress..."
yay -S zen-browser-avx2-bin spacefm golangci-lint
echo "AUR packages installed"

echo "Dotfiles setup in progress..."

mkdir -p .dotfiles
git clone https://github.com/rahulTPatil/arch_setup.git .dotfiles

yes | cp -rf .dotfiles/* .config/
mv .config/.* .

echo "Dotfiles setup completed"

echo "GOPLS installation in progress..."
go install golang.org/x/tools/gopls@latest
echo "GOPLS installation completed!"

echo "Setup completed"
