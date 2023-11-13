# Documentation for FAD (Format Any Disk) Script
Automatic script to format any disk with a FAT32 filesystem (basic, works everywhere*). Designed for noobs or for lazy people (like me)

## Description
This script allows the formatting of a selected USB drive with a FAT32 filesystem. It provides the user with the ability to choose the device to format, assign a custom label to the filesystem, and select a mount point. The script must be run with superuser (root) privileges to function correctly.

## Requirements
- A Linux-based operating system.
- Superuser (root) privileges to run the script.

## Usage
1. **Save the Script**: Copy the script content into a file, e.g., `format_any_usb.sh`.
2. **Make the Script Executable**: Execute `chmod +x format_any_usb.sh` to make the script executable.
3. **Run the Script**: Run the script as superuser with `sudo ./format_any_usb.sh`.

## Features
- **Device Listing**: Displays the storage devices available on the system.
- **Device Selection**: Allows the user to specify the device to format.
- **Formatting Confirmation**: Requests confirmation before proceeding with formatting to prevent accidental data loss.
- **Label Assignment**: Allows the user to assign a custom label to the FAT32 filesystem.
- **Mount Point Selection**: Enables the user to specify a mount point for the formatted drive.
- **Formatting and Mounting**: Formats the selected device with FAT32 and mounts it at the specified point.

## Security Considerations
- **Device Confirmation**: Ensure the correct device is selected to avoid data loss.
- **Data Backup**: It's recommended to backup data before proceeding with formatting.
- **Root Execution**: This script makes changes to partitions and filesystems, which requires superuser privileges.

## Script Outputs
- The script informs the user about each step it performs, including unmounting partitions, formatting the device, and mounting the formatted partition.
- Upon completion, it displays a message confirming that the device has been formatted and mounted successfully.

## Limitations
- Designed for Linux-based operating systems.
- Formats the selected drive only with the FAT32 filesystem.
- Requires superuser privileges for execution.
