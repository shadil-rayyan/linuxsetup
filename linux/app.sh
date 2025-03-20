#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install common dependencies
sudo apt install -y wget curl apt-transport-https ca-certificates software-properties-common

# # Install Android Studio
# # Install required dependencies
# sudo apt install -y openjdk-11-jdk
# # Download Android Studio
# wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.3.1.13/android-studio-2024.3.1.13-linux.tar.gz -O /tmp/android-studio.tar.gz
# # Extract the tar.gz file to /opt directory
# sudo tar -xvzf /tmp/android-studio.tar.gz -C /opt
# # Create a symlink to easily run Android Studio from anywhere
# sudo ln -s /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio


# Install Discord
wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb
sudo apt-get install -f -y  # Resolve dependencies

# Install Slack
wget -O /tmp/slack.deb "https://downloads.slack-edge.com/releases/linux/4.24.0/prod/x64/slack-desktop-4.24.0-amd64.deb"
sudo dpkg -i /tmp/slack.deb
sudo apt-get install -f -y  # Resolve dependencies

# # Install Figma (via Figma Linux app package)
# wget -O /tmp/figma-linux.deb "https://desktop.figma.com/linux/Figma-linux-0.9.6.deb"
# sudo dpkg -i /tmp/figma-linux.deb
# sudo apt-get install -f -y  # Resolve dependencies

# Install KDE Connect (For connecting Android with your PC)
sudo apt install -y kdeconnect

# Install VLC Media Player
sudo apt install -y vlc

# # Install Notion (via snap)
# sudo snap install notion-snap

# # Install Obsidian (via Obsidian official repository)
# wget -qO - https://obsidian.md/download | grep -oP '(?<=href=")[^"]*' | grep -m 1 "linux" | wget -i -
# sudo dpkg -i obsidian-linux*.deb
# sudo apt-get install -f -y  # Resolve dependencies

# Install OBS Studio (via apt repository)
sudo apt install -y obs-studio

# Install Telegram
sudo snap install telegram-desktop

# Install Visual Studio Code (via Microsoft repository)
sudo apt update
sudo apt install -y software-properties-common
sudo apt install -y curl
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# Install Cubic (Custom Ubuntu ISO Creator)
sudo add-apt-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install -y cubic

# Install VirtualBox (official Oracle package)
sudo apt install -y virtualbox

# Clean up temporary files
sudo apt autoremove -y
sudo apt clean

# Print installation summary
echo "Installation of requested apps is complete."
# echo "Installed Apps:"
# echo "- Android Studio"
echo "- Discord"
echo "- Slack"
# echo "- Figma"
echo "- KDE Connect"
echo "- VLC"
# echo "- Notion"
echo "- OBS Studio"
echo "- Telegram"
echo "- VS Code"
echo "- Cubic"
echo "- VirtualBox"
