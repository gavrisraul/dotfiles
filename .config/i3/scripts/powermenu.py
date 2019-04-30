import subprocess

output = subprocess.check_output("i3-nagbar -t error -m 'Power menu' -b 'Shutdown!' 'shutdown now' -b 'Reboot!' 'reboot' -b 'Logout!' 'i3-msg exit' -b 'Lock!' 'i3-msg exec i3lock'", shell=True)
subprocess.call(output)
