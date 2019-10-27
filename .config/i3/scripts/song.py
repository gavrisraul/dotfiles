import json
import datetime
import subprocess
import time

def _replace(element):
    return element.replace("b'", '').replace('\\n', '').replace("'", '').replace('\\', '')

output2 = subprocess.check_output("ps -u rg", shell=True)

if 'Google Play Mus' in str(output2):
    is_google_play_music = True
else:
    is_google_play_music = False

if 'spotify' in str(output2):
    is_spotify = True
else:
    is_spotify = False

if is_google_play_music and is_spotify:
    print('only one player allowed')

if is_google_play_music or is_spotify:
    song_artist = _replace(str(subprocess.check_output("playerctl metadata --format '{{ artist }}'", shell=True)))
    song_title = _replace(str(subprocess.check_output("playerctl metadata --format '{{ title }}'", shell=True)))
    is_playing = _replace(str(subprocess.check_output("playerctl metadata --format '{{ status }}'", shell=True)))
    total_time =  _replace(str(subprocess.check_output("playerctl metadata --format '{{ mpris:length }}'", shell=True)))
    total_time = int(total_time)
    #  current_time = check_current_time(total_time, is_playing)
    #  current_time = str(datetime.timedelta(seconds=current_time))
    total_time = str(datetime.timedelta(seconds=total_time//1000000))

    print(f'{song_artist} : {song_title} -> current_time / {total_time} {is_playing}')
else:
    print('music')
#playerctl metadata --format '{{ playerName }}: {{ artist }} - {{ title }} {{ duration(position) }}|{{ duration(mpris:length) }}'
