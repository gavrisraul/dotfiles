# sudo chmod u+s /usr/bin/brightnessctl
import re
import subprocess

output = subprocess.check_output("brightnessctl", shell=True)
print('brightness  ' + re.search(r'(?P<brightness>\d+%)', str(output)).group('brightness'))
