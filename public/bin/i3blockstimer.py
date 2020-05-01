# Modified from https://github.com/amireldor/i3blockstimerthing
#
# To install make this file executable and add the following block to
# /etc/regolith/i3xrocks/config
#
# [timer]
# command=python3 $HOME/dotfiles/public/bin/i3blockstimer.py
# interval=1

from datetime import datetime
import os.path

filename = "/tmp/i3blockstimer.txt"
start_time = datetime.now()

def write_start_file_with_now():
  with open(filename, "w") as start_file:
    start_time = datetime.now()
    start_file.write(str(int(start_time.timestamp())))
    return start_time

if os.getenv('button') is None:
  try:
    with open(filename, "r") as start_file:
      lines = start_file.readlines()
      start_time = datetime.fromtimestamp(int(lines[0]))
  except:
    pass
else:
  if os.path.exists(filename):
    os.remove(filename)
  else:
    start_time = write_start_file_with_now()

dt = datetime.now() - start_time
total_seconds = dt.total_seconds()
minutes = str(int(total_seconds / 60))
seconds = str(int(total_seconds % 60)).zfill(2)
formatted = f"⏱ {minutes}:{seconds}"
print(formatted)
