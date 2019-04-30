import re
import subprocess
output = subprocess.check_output("acpi", shell=True)
print(re.search(':\s(?P<battery>.+?\d+%)', str(output)).group('battery'))
