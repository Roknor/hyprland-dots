#!/usr/bin/env python
import subprocess

def check_hyprbars():
    result = subprocess.run(['hyprctl', 'plugins', 'list'], capture_output=True, text=True)

    if 'hyprbars' in result.stdout:
        subprocess.run(['hyprpm', 'disable', 'hyprbars'])
    else:
        subprocess.run(['hyprpm', 'enable', 'hyprbars'])

if __name__ == "__main__":
    check_hyprbars()
