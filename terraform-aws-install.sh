#!/bin/bash
#
# Download and install AWS CLI v2 (latest)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Install unzip if needed
sudo apt install unzip -y

# Extract
unzip awscliv2.zip

# Install
sudo ./aws/install

# Verify
aws --version

# Optional: Clean up
rm -rf awscliv2.zip aws
