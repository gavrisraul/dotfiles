import re
import subprocess

output = subprocess.check_output("amixer -D pulse get Master", shell=True)
volume = re.search(r'\[(?P<volume>\d+%)\]', str(output)).group('volume')

custom_volume = int(volume.replace('%', ''))

if custom_volume >= 70 and custom_volume <= 100:
    print(f'volume 🔊 {volume}')
elif custom_volume >= 50 and custom_volume <= 69:
    print(f'volume 🔉 {volume}')
elif custom_volume >= 5 and custom_volume <= 49:
    print(f'volume 🔈 {volume}')
elif custom_volume >= 0 and custom_volume <= 4:
    print(f'volume 🔇 {volume}')
