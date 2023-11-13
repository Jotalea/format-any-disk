#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "> This must run with root privileges."
    exit 1
fi

if [ "$1" == "-u" ] || [ "$1" == "--uninstall" ]; then
    echo "> Uninstalling 'FAD'..."
    rm /bin/fad

    if [ $? -eq 0 ]; then
        echo "> 'FAD' uninstalled successfully."
    else
        echo "> Error: Failed to uninstall 'FAD'."
    fi
    exit
else
    if [ ! -f "formatanydisk.sh" ]; then
        echo "> Error: 'formatanydisk.sh' not found in the current directory."
        exit 1
    fi

    echo "> Installing 'FAD'..."
    cp formatanydisk.sh /bin/fad

    chmod +x /bin/fad

    echo "> 'FAD' installed successfully. You can run it using the 'fad' command (as root or with 'sudo fad')."
    echo "> You can uninstall it by running 'sudo ./install.sh -u' or 'sudo ./install.sh --uninstall'."
fi
