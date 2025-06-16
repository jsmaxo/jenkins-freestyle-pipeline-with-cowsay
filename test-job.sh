#!/bin/bash

# Validate that the file exists
if [ ! -f advice.json ]; then
  echo "Error: advice.json not found!"
  exit 1
fi

echo "Validating advice.json..."

# Check for jq
if ! command -v jq > /dev/null; then
  echo "Error: jq is not installed!"
  exit 1
fi

# Extract the message
message=$(jq -r '.advice.message' advice.json)

# Validate and save
if [ -z "$message" ] || [ "$message" == "null" ]; then
  echo "Test Failed: No message found in advice.json"
  exit 1
else
  echo "Test Passed: Message found - $message"
  echo "$message" > advice.message
fi
