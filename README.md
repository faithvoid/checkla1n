# sakura1n
sakura1n - Pi Zero based headless iOS jailbreak solution for multiple iOS versions.
## This is still in early alpha, this may not function correctly or at all!
![](icon.png)

# How To Use
- Install Raspbian Lite on your Raspberry Pi model of choice (would recommend a Pi Zero 1/2 for the smallest footprint!)
- Once you have your Raspbian Lite image set up on your Pi, SSH into your Raspberry Pi and run the below command in your terminal:
``` wget https://raw.githubusercontent.com/faithvoid/sakura1n/refs/heads/main/install.sh && chmod +x install.sh && ./install.sh ```
- (Optional) Enable the "sakura1n" service with "sudo systemctl enable sakura1n" to automatically enable the sakura1n interface upon every boot!
- Once installed, you can start sakura1n by typing "sudo systemctl start sakura1n". Within a few seconds, you should have a web server up and running, and/or a GUI appear on your SPI display!

# Planned Features
- All available checkm8/checkra1n/palera1n jailbreaks for all iOS versions up until 14!
- Project Sandcastle support for loading Linux / Android
- Fully headless, can be controlled with either an SPI display with buttons, or via a web app!

# Requirements
- iOS device on a version lower than iOS 14
- Raspberry Pi Zero 1-2 (W) running Raspbian Lite
- Lightning Cable (ideally OEM, or rarer, microUSB to lightning to avoid any adapter interference. Longer/unofficial cables can cause issues!)
- 5V + 1.2A power supply (any less can cause voltage issues which may result in unsuccessful jailbreak attempts!)

# Issues
- A7 devices are currently not supported due to a checkra1n bug!
- May not be as reliable as running checkra1n on a macOS system due to the above bug + other unspecified checkra1n Linux issues.

# TODO:
- Create SPI display app for controlling various DFU / jailbreak features
- Integrate other jailbreaks for iOS versions that checkra1n doesn't support (ie; palera1n for 15+ support).
- Lots and lots and lots of testing!

# Why?
Having a set-it-and-forget-it piece of hardware for a series of devices you frequently work with is always helpful, and makes diagnostics, software repair and other tasks infinitely simpler. 

# Credits
- checkra1n team (jailbreak utility)
- Adrian Jagielak (bypass utility)

# Disclaimer
This repository is for educational purposes only. Make sure to consult your country's laws on jailbreaking your devices before using any of the bundled applications! Jailbreaking your device can also void your warranty and Apple can deny any official support for your device. Additionally, no warranty or liability is provided with this software to the fullest applicable extent of the law. The end user takes full responsibility for anything that may happen to their device, such as data loss or bricking. Please do your research before using any of these utilities.
