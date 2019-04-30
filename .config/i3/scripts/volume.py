import re
import subprocess
output = subprocess.check_output("amixer -c 1 -M -D pulse get Master", shell=True)
volume = re.search('\[(?P<volume>\d+%)\]', str(output)).group('volume')
print('volume:' + volume)
