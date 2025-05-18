import network
import time
from secrets import secrets

def connect():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print("🔌 Connecting to Wi-Fi...")
        wlan.connect(secrets["ssid"], secrets["password"])
        timeout = 10
        while not wlan.isconnected() and timeout > 0:
            print("⏳ Waiting for connection...")
            time.sleep(1)
            timeout -= 1
    if wlan.isconnected():
        print("✅ Connected:", wlan.ifconfig())
    else:
        raise RuntimeError("❌ Wi-Fi connection failed")
