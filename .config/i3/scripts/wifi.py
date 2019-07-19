import re
import subprocess

output = subprocess.check_output("iwconfig", shell=True)
wifi_name = re.search(r'ESSID:"(?P<wifi>.+?)"', str(output)).group('wifi')
wifi_signal_strength = re.search(r'level=(?P<signal_strength>.\d+).+dBm', str(output)).group('signal_strength')
custom_strength = int(wifi_signal_strength.replace('-', ''))

if custom_strength >=30 and custom_strength <= 50:
    percent = '100%'
elif custom_strength >= 51 and custom_strength <= 60:
    percent = '90%'
elif custom_strength >= 61 and custom_strength <= 66:
    percent = '80%'
elif custom_strength >= 67 and custom_strength <= 70:
    percent = '70%'
elif custom_strength >= 71 and custom_strength <= 80:
    percent = '55%'
elif custom_strength >= 81 and custom_strength <= 90:
    percent = '45%'
elif custom_strength >= 91:
    percent = '15%'

print(f'wifi   {wifi_name} strength   {wifi_signal_strength}/{percent}')
#-30dbm -> %100
#-50dbm -> %90
#-60dbm -> %80
#-67dbm -> %70
#-70dbm -> %55
#-80dbm -> %45
#-90dbm -> %15


