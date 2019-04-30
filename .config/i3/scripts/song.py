import json
import datetime
import subprocess

output2 = subprocess.check_output("ps -u rg", shell=True)

if 'Google Play Mus' in str(output2):
    is_google_play_music = True
else:
    is_google_play_music = False

if is_google_play_music:
    output1 = subprocess.check_output("cat /home/rg/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json", shell=True)
    music_dict = json.loads(output1)

    is_playing = music_dict['playing']
    if is_playing:
        is_playing = 'Playing'
    else:
        is_playing = 'Paused'
    song_title = music_dict['song']['title']
    song_artist = music_dict['song']['artist']
    current_time = music_dict['time']['current']
    total_time = music_dict['time']['total']

    current_time = str(datetime.timedelta(seconds=current_time//1000))
    total_time = str(datetime.timedelta(seconds=total_time//1000))

    print(song_artist + ' : ' + song_title + ' -> ' + current_time + ' / ' + total_time + ' ' + is_playing)
else:
    print('music')
