@echo off

REM Defining Python code
set python_code=^
import time\n^
import winreg\n^
\n^
def print_progress(progress):  \n^
    sys.stdout.write('\rProgress: %d%%' % progress)\n^
    sys.stdout.flush()\n^
\n^
def create_registry_key(key_path, values):\n^
    try:\n^
        key = winreg.CreateKey(winreg.HKEY_LOCAL_MACHINE, key_path)\n^
\n^
        for i, (value_name, value_data) in enumerate(values.items()):\n^
            winreg.SetValueEx(key, value_name, 0, winreg.REG_DWORD, value_data)\n^
            progress = int((i + 1) / len(values) * 100)\n^
            print_progress(progress)\n^
            time.sleep(0.1)\n^
\n^
        winreg.CloseKey(key)\n^
        print('\nRegistry key and values have been created successfully.')\n^
\n^
    except Exception as e:\n^
        print('\nAn error occurred while creating the registry key and values:', str(e))\n^
\n^
import sys\n^
import threading\n^
\n^
# Function to close CMD window after a timer
def close_cmd_window():\n^
    time.sleep(15)\n^
    sys.exit(0)\n^
\n^
# Create a new thread to close CMD window
close_cmd_thread = threading.Thread(target=close_cmd_window)\n^
close_cmd_thread.start()\n^
\n^
# Registry key and values\n^
key_path = r'SYSTEM\Setup\LabConfig'\n^
values = {\n^
    'BypassRAMCheck': 1,\n^
    'BypassTPMCheck': 1,\n^
    'BypassSecureBootCheck': 1,\n^
    'BypassCPUCheck': 1\n^
}\n^
\n^
print('Creating registry key and values...')\n^
create_registry_key(key_path, values)\n^
\n^
# Wait for the close_cmd_thread to complete
close_cmd_thread.join()

REM Display a message after the Python code is executed
echo The Python code has been executed successfully.
