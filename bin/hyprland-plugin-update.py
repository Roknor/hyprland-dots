import subprocess, os

def check_updates():
    os.system(f'notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low "Checking for plugin updates"')
    result = subprocess.run(['hyprpm', 'update'], capture_output=True, text=True)

    if 'up-to-date' in result.stdout:
        os.system(f'notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low "Plugins are up to date"')
        os.system(f'hyprpm disable hyprbars')
    else:
        os.system(f'notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low "Plugin updates installed successfully"')

if __name__ == "__main__":
    check_updates()
