from machine import ADC, Pin
import time

# Use ADC0 (GP26, Pin 31)
moisture = ADC(Pin(26))

while True:
    raw = moisture.read_u16()  # Range: 0–65535
    percent = 100 - int((raw / 65535) * 100)  # More % = drier
    print(f"Moisture: {percent}% (Raw: {raw})")
    time.sleep(2)
