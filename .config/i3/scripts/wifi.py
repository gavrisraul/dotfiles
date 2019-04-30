import re
import subprocess

output = subprocess.check_output("iwconfig", shell=True)
wifi_name = re.search('ESSID:"(?P<wifi>.+?)"', str(output)).group('wifi')
wifi_signal_strength = re.search('level=(?P<signal_strength>.\d+).+dBm', str(output)).group('signal_strength')
print('wifi: ' + wifi_name, 'strength: ' + wifi_signal_strength)
#-30dbm -> %100
#-50dbm -> %90
#-60dbm -> %80
#-67dbm -> %70
#-70dbm -> %55
#-80dbm -> %45
#-90dbm -> %15


