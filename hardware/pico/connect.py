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
