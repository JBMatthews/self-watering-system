# ESP8266 Self-Watering System

This folder contains code to run the ESP8266-based automated watering device.

## Files
- `connect.py`: Connects to Wi-Fi using stored credentials
- `main.py`: Main logic — reads moisture, logs to SN, waters plant
- `secrets.py`: Stores SSID, SN instance, and API credentials

## ESP8266 Info
- IP Address: `10.0.0.105`
- WebREPL Password: `waterme`

## Useful WebREPL Commands

### Upload  to the ESP:
```bash
python3 webrepl_cli.py -p waterme main.py 10.0.0.105:main.py
```

### Reboot ESP to run:
```python
import machine
machine.reset()
```

---
