#!/bin/bash

# German Tiger Tank ASCII Banner
echo "                             ___       ___
                     ___====[_]===___
              ____====  ____/  []  \____====
       __--'----,---'----|    --    |--'----,-----'__
     /     : :   :   /  :  :    .    :   :    :  \   \
  ,-/-  -  -    -  - -    -    -    -    -  -  -  -  -\-,
 /      , ,     ,    /  ,    .    ,    ,     .  ,    ,    \  
 |-- -- --- -- - - -- - -- - -- - -- - -- - -- -- - --- --|
'---__|  |____|__|____|__|____|__|____|__|____|__|____|__|___'
                        /    '    /    \   \    \   \    \   \
                      /_____/____/_____/_____/_____/_____/
                          /     /  '   /      /
                        /_____/____/_____/_____/
"

echo "Firing codename: Ianwolf99"
echo

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update package list
echo "Updating package list..."
sudo apt update

# Install UFW if not installed
if command_exists ufw; then
    echo "UFW is already installed."
else
    echo "Installing UFW..."
    sudo apt install -y ufw
fi

# Set default policies
echo "Setting default policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH connections (port 22)
echo "Allowing SSH connections..."
sudo ufw allow ssh

# Enable UFW
echo "Enabling UFW..."
sudo ufw enable

# Confirm UFW status
echo "Checking UFW status..."
sudo ufw status verbose

echo "UFW installation and basic configuration complete."

