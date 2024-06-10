### README for UFW Installation and Configuration Script

## Overview

Welcome to the UFW Installation and Configuration Script! This script is designed to streamline the process of installing and configuring the Uncomplicated Firewall (UFW) on your Linux system. It ensures your firewall is set up with basic security measures, allowing you to focus on other important tasks.

## Features

- **Automatic UFW Installation**: Checks if UFW is installed and installs it if not.
- **Default Policy Configuration**: Sets default policies to deny all incoming connections and allow all outgoing connections.
- **SSH Allowance**: Configures the firewall to allow SSH connections to prevent being locked out of remote servers.
- **Status Verification**: Displays the current status and rules of UFW.
- **Creative ASCII Art**: Starts with an ASCII image of a German Tiger Tank to add a fun and engaging element to the script.

## Prerequisites

- A Debian-based Linux distribution (such as Ubuntu).
- Sudo privileges to install packages and configure firewall rules.

## Installation

### Step 1: Download the Script

First, download the `install-ufw.sh` script to your preferred directory. You can do this by either copying the script content into a new file or downloading it directly.

### Step 2: Make the Script Executable

Change the permissions of the script to make it executable. Open your terminal and navigate to the directory where the script is saved, then run:

```bash
chmod +x install-ufw.sh
```

### Step 3: Run the Script

Execute the script by running:

```bash
./install-ufw.sh
```

### What to Expect

When you run the script, you'll see the following:

1. **ASCII Art Banner**: An ASCII representation of a German Tiger Tank will be displayed, adding a fun start to the script.
2. **Package List Update**: The script will update your package list to ensure the latest versions of packages are available.
3. **UFW Installation**: If UFW is not already installed, the script will install it. If it is already installed, it will notify you.
4. **Default Policy Configuration**: The script will set the default policy to deny all incoming connections and allow all outgoing connections.
5. **SSH Allowance**: The script will configure UFW to allow SSH connections to ensure you can still access your remote server.
6. **Enable UFW**: UFW will be enabled, and the current status and rules will be displayed.

## Script Content

Here is the content of the `install-ufw.sh` script for reference:

```bash
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
```

## Troubleshooting

If you encounter any issues while running the script, here are a few steps to troubleshoot:

1. **Permission Denied**: Ensure the script has executable permissions. Run `chmod +x install-ufw.sh` to fix this.
2. **Sudo Password**: You might be prompted to enter your sudo password during the execution. Ensure you have the necessary sudo privileges.
3. **Network Issues**: If the package list update fails, check your internet connection and try again.

## Conclusion

This script simplifies the process of installing and configuring UFW on your Linux system. With a few easy steps, you can enhance your system's security and enjoy a creative start with the ASCII art banner. Happy firewalling!

---

