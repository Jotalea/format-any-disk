# Documentation for FAD (Format Any Disk) Script
Automatic script to format any disk with a FAT32 filesystem (a basic format, works almost everywhere).

## Description
This script allows the formatting of a selected USB drive with a FAT32 filesystem. It provides the user with the ability to choose the device to format, assign a custom label to the filesystem, and select a mount point. The script must be run with superuser (root) privileges to function correctly.
Note: Anything that this script does can be done by yourself, just by learning and using the commands; this is just a script to automate that process, in a format that works on most devices. If you want a different format, you can try to modify the script or you can run the commands by yourself.

## Requirements
- A Linux-based operating system.
- Git installed on your system (or an alternative way to download the scripts).
- Superuser (root) privileges to run the script.

## Installation
1. **Clone the Repository**: Clone the FAD repository from GitHub to your local machine using:
```git clone https://github.com/Jotalea/format-any-disk.git```
2. **Navigate to the Repository Directory**: Change into the cloned directory:
```cd format-any-disk```
3. **Run the Installation Script**: Make the `install.sh` script executable and run it with root privileges:
To make the installer executable
```sudo chmod +x install.sh```
To install the program
```sudo ./install.sh```
This will install `FAD` on your system, making it accessible system-wide.

## Usage
- After installation, you can run FAD from anywhere in the terminal by simply typing `sudo fad`.
- Follow the on-screen prompts to select the USB device, set a label, and choose a mount point.

## Features
- **Device Listing**: Lists available storage devices.
- **Device Selection**: Enables specifying the device to format.
- **Formatting Confirmation**: Requests confirmation to prevent accidental data loss.
- **Label Assignment**: Allows setting a custom label for the FAT32 filesystem.
- **Mount Point Selection**: Enables specifying the mount point for the formatted drive.
- **Formatting and Mounting**: Formats the selected device and mounts it.

## Security Considerations
- **Device Confirmation**: Carefully select the correct device to avoid data loss.
- **Data Backup**: Back up important data before formatting.
- **Root Execution**: The script and the installer must be run as root due to the nature of the operations involved.

## Script Outputs
- Detailed step-by-step instructions are provided during the script execution.
- Confirmation messages are shown upon successful formatting and mounting.

## Limitations
- Designed for Linux-based systems.
- Only formats with the FAT32 filesystem.
- Requires superuser privileges for execution and installation.

## Repository Information
- The FAD script is hosted on GitHub at `https://github.com/Jotalea/format-any-disk.git`.
