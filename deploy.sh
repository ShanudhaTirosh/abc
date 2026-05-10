#!/bin/bash

# Update and install dependencies (assumes Ubuntu/Debian)
sudo apt update
sudo apt install -y nodejs npm git

# Install pm2 globally
sudo npm install -g pm2

# Clone the repository (if not already cloned)
if [ ! -d "abc" ]; then
  git clone https://github.com/nbbb15092/abc.git
fi

cd abc

# Install bot dependencies
npm install

# Create config.env
cat <<EOT > config.env
SESSION_ID=ASITHA-MD=668d2a42d27c9793
PORT=8000
SESSION_NAME=asitha
EOT

# Start the bot using pm2
npm start

# Save pm2 process list and set to start on boot
pm2 save
pm2 startup
