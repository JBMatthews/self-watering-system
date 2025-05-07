#!/bin/bash

# Create root project folder
mkdir pico

# Create .gitignore
cat <<EOL > .gitignore
# Ignore secrets and compiled files
pico/secrets.py
__pycache__/
*.pyc
EOL

# Create secrets_example.py
cat <<EOL > pico/secrets_example.py
# 🔒 COPY this file to secrets.py and add your real Wi-Fi credentials.
# DO NOT COMMIT secrets.py to GitHub.

secrets = {
    'ssid': 'YOUR_WIFI_SSID',
    'password': 'YOUR_WIFI_PASSWORD'
}
EOL

# Create basic connect.py
cat <<EOL > pico/connect.py
import network
import time
from secrets import secrets

def connect():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(secrets['ssid'], secrets['password'])

    max_wait = 10
    while max_wait > 0:
        if wlan.status() < 0 or wlan.status() >= 3:
            break
        max_wait -= 1
        print("Connecting...")
        time.sleep(1)

    if wlan.status() != 3:
        raise RuntimeError('Wi-Fi connection failed')
    else:
        print("✅ Connected")
        status = wlan.ifconfig()
        print("IP Address:", status[0])
EOL

# Create placeholder README.md
cat <<EOL > README.md
# 🌿 Self-Watering System

This is a full-stack project using a Raspberry Pi Pico W and ServiceNow.
See \`pico/secrets_example.py\` for Wi-Fi setup.

🔧 Folders:
- \`pico/\` — code running on the Pico W
- \`hardware/\` — code for Pi 2 (if used)
- \`servicenow/\` — docs, exports, and Flow references
EOL

# Initialize Git
git init
echo "✅ Project structure created and Git initialized."

