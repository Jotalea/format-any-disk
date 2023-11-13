#!/bin/bash

# Current version of FAD
CURRENT_VERSION="1.0.3"
REPO_USER="Jotalea"
REPO_NAME="format-any-disk"

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "> This script must be run as root."
    exit 1
fi

# Version
if [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
    echo "> FAD - Format Any Disk"
    echo "> Version $CURRENT_VERSION"
    exit 0
fi

# Uninstall
if [ "$1" == "-u" ] || [ "$1" == "--uninstall" ]; then
    echo "> FAD - Format Any Disk"

    # Check if FAD is installed
    if [ -f "/bin/fad" ]; then
        read -p "< FAD is installed. Do you want to uninstall it? (y/n): " confirm
        if [ "$confirm" == "y" ]; then
            # Uninstalling FAD
            rm /bin/fad
            if [ $? -eq 0 ]; then
                echo "> FAD uninstalled successfully."
            else
                echo "> Error: Failed to uninstall FAD."
            fi
        else
            echo "> Uninstallation cancelled."
        fi
    else
        echo "> FAD is not installed."
    fi

    exit 0
fi

# Check for updates
if [ "$1" == "-c" ] || [ "$1" == "--check-update" ]; then
    echo "> Checking for updates..."
    # Fetch the latest tag (version) from the GitHub repository
    LATEST_VERSION=$(curl -s "https://api.github.com/repos/$REPO_USER/$REPO_NAME/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

    if [ "$LATEST_VERSION" == "$CURRENT_VERSION" ]; then
        echo "> You are using the latest version of FAD."
    else
        echo "> A new version of FAD is available: $LATEST_VERSION"
        echo "> You can download it from https://github.com/$REPO_USER/$REPO_NAME/releases"
    fi

    exit 0
fi

# Warning
echo "> WARNING: JOTALEA DOES NOT ASSUME ANY RESPONSIBILITY FOR DATA LOSS OR ANY FORM OF DAMAGE RESULTING FROM THE USE OF THIS SCRIPT."

# List available devices
echo "> Available devices:"
lsblk -p | grep -v "rom\|loop\|part\|sr"

# Ask the user to specify the device to format
read -p "< Enter the device to format (e.g., /dev/sdb): " device

# Confirm the selected device
echo "> You have selected: $device"
echo "> Are you sure you want to format this device?"
read -p "< This will erase all data on it (y/n): " confirmation
if [ "$confirmation" != "y" ]; then
    echo "Operation cancelled."
    exit
fi

# Ask for the desired label name for the device
read -p "< Enter the name you want for the device: " label

# Ask for the mount point
read -p "< Enter the mount point (e.g., /media/usb): " mount_point

# Unmount the device's partitions
echo "> Unmounting partitions..."
umount ${device}* 2>/dev/null

# Format the device
echo "> Formatting the device..."
fdisk ${device} <<EOF
o
n
p
1

t
b
w
EOF

# Create a FAT32 filesystem on the partition
echo "> Creating FAT32 filesystem..."
mkfs.vfat ${device}1

# Change the filesystem label
echo "> Changing label to '$label'..."
dosfslabel ${device}1 "$label"

# Mount the partition
echo "> Mounting the partition at $mount_point..."
mkdir -p $mount_point
mount ${device}1 $mount_point

echo "> The device has been formatted and mounted at $mount_point."
