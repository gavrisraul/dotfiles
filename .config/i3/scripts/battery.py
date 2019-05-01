import re
import subprocess

output = subprocess.check_output("acpi", shell=True)
battery_state = re.search(r'\s(?P<state>\w+),', str(output)).group('state')
battery_value = re.search(r'(?P<value>\d+%)', str(output)).group('value')
custom_value = int(battery_value.replace('%', ''))
if custom_value >= 80 and custom_value <= 100:
    print(f'{battery_state}   {battery_value}')
elif custom_value >= 60 and custom_value <= 79:
    print(f'{battery_state}   {battery_value}')
elif custom_value >= 40 and custom_value <= 59:
    print(f'{battery_state}   {battery_value}')
elif custom_value >= 20 and custom_value <= 39:
    print(f'{battery_state}   {battery_value}')
elif custom_value >= 0 and custom_value <= 19:
    print(f'{battery_state}   {battery_value}')

