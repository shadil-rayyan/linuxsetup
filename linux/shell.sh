#!/bin/bash

# Update and install essential dependencies
echo "Updating system and installing essential dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git zsh tmux python3-pip neovim ripgrep fonts-powerline

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# Set Zsh as the default shell
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Install Powerlevel10k Theme
echo "Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" >> ~/.zshrc

# Install Neovim (if not installed already)
echo "Installing Neovim..."
if ! command -v nvim &> /dev/null; then
  sudo apt install -y neovim
else
  echo "Neovim is already installed."
fi

# Update Neovim to the latest stable version
echo "Updating Neovim..."
sudo apt install -y neovim
sudo apt install -y neovim-qt

# Install LazyVim
echo "Installing LazyVim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Tmux
echo "Installing Tmux..."
if ! command -v tmux &> /dev/null; then
  sudo apt install -y tmux
else
  echo "Tmux is already installed."
fi

# Finalizing the installation
echo "All installations are complete. Please restart your terminal to apply the changes."

# Instructions to reload .zshrc
echo "To apply changes to Zsh, run: source ~/.zshrc"
echo "To start using LazyVim, open Neovim and run :PlugInstall"

