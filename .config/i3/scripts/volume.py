import re
import subprocess

output = subprocess.check_output("amixer -D pulse get Master", shell=True)
volume = re.search(r'\[(?P<volume>\d+%)\]', str(output)).group('volume')

custom_volume = int(volume.replace('%', ''))

if custom_volume >= 80 and custom_volume <= 100:
    print(f'volume  {volume}')
elif custom_volume >= 60 and custom_volume <= 79:
    print(f'volume 墳{volume}')
elif custom_volume >= 40 and custom_volume <= 59:
    print(f'volume  {volume}')
elif custom_volume >= 20 and custom_volume <= 39:
    print(f'volume 奔{volume}')
elif custom_volume >= 10 and custom_volume <= 19:
    print(f'volume  {volume}')
elif custom_volume > 0 and custom_volume < 10:
    print(f'volume ﱝ{volume}')
elif custom_volume == 0:
    print(f'volume ﱝ {volume}')
