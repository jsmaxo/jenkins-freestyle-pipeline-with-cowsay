#!/bin/bash

# Step 1: Ensure cowsay is installed manually (not in Jenkins script)
if ! command -v cowsay > /dev/null; then
    echo "Error: cowsay not found. Please install it on the host using:"
    echo "sudo apt-get update && sudo apt-get install -y cowsay"
    exit 1
fi

# Step 2: Set correct path
export PATH="$PATH:/usr/games:/usr/local/games"

# Step 3: Validate advice.message exists
if [ ! -f advice.message ]; then
    echo "Error: advice.message not found!"
    exit 1
fi

# Step 4: Read and display the message using cowsay
message=$(cat advice.message)
cowfile=$(ls /usr/share/cowsay/cows | shuf -n 1)

echo "$message" | cowsay -f "$cowfile"
