#!/bin/bash

# Create advice.json with a meaningful message
echo "Generating advice.json..."
cat <<EOF > advice.json
{
  "advice": {
    "message": "Code is read more often than it is written—optimize for clarity, not cleverness."
  }
}
EOF

echo "advice.json created:"
cat advice.json
