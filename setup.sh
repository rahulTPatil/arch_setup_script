#!/usr/bin/env sh

cd ~
sudo pacman -Syu
sudo pacman -S --needed base-devel helix git fzf ripgrep btop jq fish zed wezterm yazi zoxide chafa fd p7zip ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-jetbrains-mono-nerd

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ~
yay -S zen-browser-avx2-bin spacefm golangci-lint

mkdir -p .dotfiles
git clone https://github.com/rahulTPatil/arch_setup.git .dotfiles

yes | cp -rf .dotfiles/* .config/
mv .config/.* .

go install golang.org/x/tools/gopls@latest

echo "Setup completed"
