#!/bin/bash

# Tank ASCII Banner
echo "                                 __
     _________  ____  ____  _____/ /_____  _____
    / ___/ __ \/ __ \/ __ \/ ___/ //_/ _ \/ ___/
   (__  ) /_/ / /_/ / /_/ / /__/ ,< /  __/ /
  /____/ .___/ .___/\____/\___/_/|_|\___/_/
      /_/   /_/                             "
echo "Firing codename: Ianwolf99"
echo

# Function to display the menu
display_menu() {
    echo "=================================="
    echo "UFW Firewall Management Menu"
    echo "=================================="
    echo "1. Enable UFW"
    echo "2. Disable UFW"
    echo "3. Set Default Policies"
    echo "4. Enable Logging"
    echo "5. Disable Logging"
    echo "6. Allow a Port"
    echo "7. Deny a Port"
    echo "8. Allow an IP Address"
    echo "9. Delete a Rule"
    echo "10. View UFW Status"
    echo "11. List All Rules"
    echo "12. Reset UFW"
    echo "13. Manage Application Profiles"
    echo "14. Allow/Deny Specific Services"
    echo "15. Exit"
    echo "=================================="
    echo -n "Choose an option [1-15]: "
}

# Function to enable UFW
enable_ufw() {
    sudo ufw enable
    echo "UFW has been enabled."
}

# Function to disable UFW
disable_ufw() {
    sudo ufw disable
    echo "UFW has been disabled."
}

# Function to set default policies
set_default_policies() {
    echo -n "Set default incoming policy (allow/deny/reject): "
    read incoming
    echo -n "Set default outgoing policy (allow/deny/reject): "
    read outgoing
    sudo ufw default $incoming incoming
    sudo ufw default $outgoing outgoing
    echo "Default policies set: incoming=$incoming, outgoing=$outgoing."
}

# Function to enable logging
enable_logging() {
    sudo ufw logging on
    echo "Logging has been enabled."
}

# Function to disable logging
disable_logging() {
    sudo ufw logging off
    echo "Logging has been disabled."
}

# Function to allow a port
allow_port() {
    echo -n "Enter port number to allow (e.g., 80, 443): "
    read port
    sudo ufw allow "$port/tcp"
    echo "Port $port has been allowed."
}

# Function to deny a port
deny_port() {
    echo -n "Enter port number to deny (e.g., 23): "
    read port
    sudo ufw deny "$port/tcp"
    echo "Port $port has been denied."
}

# Function to allow an IP address
allow_ip() {
    echo -n "Enter IP address to allow (e.g., 192.168.1.100): "
    read ip
    echo -n "Enter port number (e.g., 22): "
    read port
    sudo ufw allow from "$ip" to any port "$port"
    echo "IP $ip has been allowed on port $port."
}

# Function to delete a rule
delete_rule() {
    sudo ufw status numbered
    echo -n "Enter the rule number to delete: "
    read number
    sudo ufw delete "$number"
    echo "Rule number $number has been deleted."
}

# Function to view UFW status
view_status() {
    sudo ufw status verbose
}

# Function to list all rules
list_all_rules() {
    sudo ufw status numbered
}

# Function to reset UFW
reset_ufw() {
    sudo ufw reset
    echo "UFW has been reset to default settings."
}

# Function to manage application profiles
manage_profiles() {
    echo "Available application profiles:"
    sudo ufw app list
    echo -n "Enter profile name to allow: "
    read profile
    sudo ufw allow "$profile"
    echo "Profile $profile has been allowed."
}

# Function to allow/deny specific services
manage_services() {
    echo "Available services: ssh, http, https"
    echo -n "Enter service name to manage (e.g., ssh): "
    read service
    echo -n "Do you want to allow or deny the service (allow/deny)? "
    read action
    sudo ufw "$action" "$service"
    echo "Service $service has been $actioned."
}

# Main script logic
while true; do
    display_menu
    read option
    case $option in
        1) enable_ufw ;;
        2) disable_ufw ;;
        3) set_default_policies ;;
        4) enable_logging ;;
        5) disable_logging ;;
        6) allow_port ;;
        7) deny_port ;;
        8) allow_ip ;;
        9) delete_rule ;;
        10) view_status ;;
        11) list_all_rules ;;
        12) reset_ufw ;;
        13) manage_profiles ;;
        14) manage_services ;;
        15) exit 0 ;;
        *) echo "Invalid option. Please choose a number between 1 and 15." ;;
    esac
    echo
done

