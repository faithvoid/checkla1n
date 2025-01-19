#!/bin/bash

# Script to install checkra1n, checkm8, palera1n, and their dependencies.
# Run this script with sudo or as root.

set -e

# Function to print status messages
function print_status {
    echo -e "\e[1;32m[*] $1\e[0m"
}

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Update the package list
print_status "Updating package list..."
apt update -y

# Install necessary dependencies
print_status "Installing dependencies..."
apt install -y \
    git \
    build-essential \
    libusbmuxd-dev \
    libplist-dev \
    libimobiledevice-dev \
    usbmuxd \
    python3 \
    python3-pip \
    libssl-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    libtool \
    libreadline-dev \
    zlib1g-dev \
    wget \
    curl

# Checkra1n installation
print_status "Installing checkra1n..."
if ! command -v checkra1n &>/dev/null; then
    mkdir /opt/sakura1n
    CHECKRA1N_URL="https://assets.checkra.in/downloads/linux/cli/arm/ff05dfb32834c03b88346509aec5ca9916db98de3019adf4201a2a6efe31e9f5/checkra1n"
    wget -O checkra1n "$CHECKRA1N_URL"
    chmod +x checkra1n
    mv checkra1n /usr/local/bin/
    print_status "Checkra1n installed successfully."
else
    print_status "Checkra1n is already installed."
fi

# Checkm8 installation
print_status "Cloning and building checkm8..."
CHECKM8_DIR="/opt/sakura1n/checkm8"
if [ ! -d "$CHECKM8_DIR" ]; then
    git clone https://github.com/axi0mX/ipwndfu.git "$CHECKM8_DIR"
    cd "$CHECKM8_DIR"
    ./ipwndfu -p || true # Ensure dependencies are set up
    print_status "Checkm8 setup complete."
else
    print_status "Checkm8 repository already exists."
fi

# Palera1n installation
print_status "Installing palera1n..."
PALERAIN_DIR="/opt/sakura1n/palera1n"
if [ ! -d "$PALERAIN_DIR" ]; then
    git clone https://github.com/palera1n/palera1n.git "$PALERAIN_DIR"
    cd "$PALERAIN_DIR"
    chmod +x palera1n.sh
    ln -sf "$PALERAIN_DIR/palera1n.sh" /usr/local/bin/palera1n
    print_status "Palera1n installed successfully."
else
    print_status "Palera1n is already installed."
fi

# Final steps
wget https://raw.githubusercontent.com/faithvoid/sakura1n/refs/heads/main/sakura1n.service
wget https://raw.githubusercontent.com/faithvoid/sakura1n/refs/heads/main/sakura1n-spi.py
wget https://raw.githubusercontent.com/faithvoid/sakura1n/refs/heads/main/sakura1n-web.py
mv sakura1n.service /etc/systemd/system
mv sakura1n-web.py /opt/sakura1n/sakura1n-web.py
mv sakura1n-spi.py /opt/sakura1n/sakura1n-spi.py
sudo systemctl start sakura1n

print_status "All tools installed successfully! sakura1n is now running!"
print_status "Checkra1n can be run using: checkra1n"
print_status "Checkm8 tools are located in: $CHECKM8_DIR"
print_status "Palera1n can be run using: palera1n"
print_status "To enable sakura1n on boot, enter the following in your terminal: sudo systemctl enable sakura1n"

