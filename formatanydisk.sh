#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
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
