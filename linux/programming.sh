#!/bin/bash

# Update package list
sudo apt update && sudo apt upgrade -y

# C and C++ Development Tools
sudo apt install build-essential -y      # For C/C++ development
sudo apt install g++ -y                  # C++ Compiler
sudo apt install clang -y                # Clang Compiler

# C# Development (dotnet SDK)
sudo apt install -y dotnet-sdk-6.0

# Java Development (OpenJDK)
sudo apt install openjdk-11-jdk -y        # OpenJDK 11 for Java development

# Python Development
sudo apt install python3 python3-pip -y   # Install Python 3 and pip (Python Package Installer)
sudo apt install python3-dev -y           # Install development headers for Python

# Node.js and npm (JavaScript)
sudo apt install nodejs -y                # Install Node.js (JavaScript)
sudo apt install npm -y                  # Node Package Manager

# Ruby Development
sudo apt install ruby-full -y             # Install Ruby

# Go (Golang)
sudo apt install golang -y                # Go (Golang) programming language

# Rust Programming Language
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Install Rust

# PHP Development
sudo apt install php php-cli php-fpm php-mysql php-xml php-curl php-mbstring php-zip -y

# Swift (via unofficial PPA for Ubuntu)
sudo apt install clang libicu-dev -y      # Swift requires Clang and ICU
sudo add-apt-repository ppa:swift-lang/ppa -y
sudo apt update
sudo apt install swift -y                # Install Swift

# Kotlin (via SDKMAN)
curl -s https://get.sdkman.io | bash      # Install SDKMAN (A package manager for JVM languages)
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install kotlin                      # Install Kotlin

# R Programming (for Data Science)
sudo apt install r-base -y               # R for statistics and data science

# Perl Development
sudo apt install perl -y                 # Perl Programming Language

# Clean up
sudo apt autoremove -y                   # Remove unnecessary packages

# Suggesting to restart the terminal for proper environment setup
echo "Installation complete. You may need to restart the terminal or log out and back in for all changes to take effect."
