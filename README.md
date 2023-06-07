# Windows 11 Compatibility Unlocker

## Introduction
This repository provides a solution to install Windows 11 on systems that do not meet the minimum requirements. It includes two methods: manual installation and using the create_registry_keys.bat file.

Please note that modifying the registry can have unintended consequences, and these methods are intended for advanced users who understand the risks involved. Use them at your own discretion.

## Manual Installation Steps

### 1. Start a Clean Windows 11 Setup
Begin the installation process by booting from a clean Windows 11 installation media, such as a CD or USB stick.

### 2. Access Command Prompt during the Installation Process
During the setup, when prompted to enter the product key, press `SHIFT + F10` to open the Command Prompt window.

### 3. Accessing and Modifying the Registry
In the Command Prompt window, type `regedit` and press Enter. This command will open the Registry Editor.

Navigate to the following registry key:

HKEY_LOCAL_MACHINE\SYSTEM\Setup

Right-click on the "Setup" key, select "New," and then choose "Key" from the context menu. Name the new key as "LabConfig".

Inside the "LabConfig" key, create four new DWORD (32-bit) Values with the following names and values:
- "BypassRAMCheck" with a value of 1
- "BypassTPMCheck" with a value of 1
- "BypassSecureBootCheck" with a value of 1
- "BypassCPUCheck" with a value of 1

Ensure that all the DWORD values have a value of 1.

### 4. Closing the Registry Editor and Command Prompt
Close the Registry Editor and the Command Prompt window.

### 5. Continue Windows 11 Installation
Proceed with the Windows 11 installation process as usual.

## Using the create_registry_keys.bat file

### Requirements
- Windows 10 or later.

### Instructions
1. Download the `create_registry_keys.bat` file from this repository.
2. Run the `create_registry_keys.bat` file with administrator privileges.
    - Right-click on the file and select "Run as administrator".
3. The Command Prompt window will display the progress of creating the registry keys.
4. Once the process is complete, you will see a message indicating that the registry key and values have been created successfully.
5. Close the Command Prompt window.

## Disclaimer
Modifying the Windows registry can have unintended consequences. These methods are intended for advanced users who understand the risks involved. The author and contributors of this repository take no responsibility for any issues or damages that may arise from the use of these methods.

Use them at your own risk.

## Contributing
Contributions are welcome! If you have suggestions or improvements, please feel free to open an issue or submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).


