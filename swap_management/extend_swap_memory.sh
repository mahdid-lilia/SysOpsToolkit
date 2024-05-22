#!/bin/bash

# Script to extend the swap memory

# Turn off the swap for the file
sudo swapoff /swapfile

# Delete the old swap file
sudo rm /swapfile

# Create a new swap file with the desired size (default 2G, can be changed)
SWAP_SIZE=${1:-2G}
sudo fallocate -l $SWAP_SIZE /swapfile

# Set the right permissions
sudo chmod 600 /swapfile

# Set up the swap area
sudo mkswap /swapfile

# Enable the swap file
sudo swapon /swapfile

# Verify the swap is working
echo "Swap is now set to:"
sudo swapon --show
free -h
