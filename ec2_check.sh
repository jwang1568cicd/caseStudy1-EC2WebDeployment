#!/bin/bash

# Function to check if SSH connection is successful
function check_ssh_connection() {
  local host=$1
  local identity_file=$2
  # Try to SSH to the host with a connection timeout of 5 seconds
  if ssh -o ConnectTimeout=10 -i "$identity_file" "ec2-user@""$host" exit &> /dev/null; then
    return 0
  else
    return 1
  fi
}

# Function to check if a package is installed
function check_package() {
  local package=$1
  if rpm -q $package &> /dev/null; then
    echo "$package is already installed."
    return 0
  else
    return 1
  fi
}


# Check if the required arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <hostname> <identity_file>"
  exit 1
fi

hostname=$1
identity_file=$2

# Check if the SSH connection is successful
if check_ssh_connection "$hostname" "$identity_file"; then
  echo "SSH connection to EC2, $hostname, was successful."
else
  echo "SSH connection to EC2, $hostname, failed. Please check the hostname, identity file, and network settings."
  exit 1
fi
